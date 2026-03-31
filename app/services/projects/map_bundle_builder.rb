module Projects
  class MapBundleBuilder
    def initialize(project)
      @project = project
    end

    def call
      {
        project: project_payload,
        config: project.merged_config,
        layersData: layers_data,
        legends: serialize_legends
      }
    end

    private

    attr_reader :project

    def project_payload
      {
        id: project.id,
        name: project.name,
        slug: project.slug,
        scope_mode: project.scope_mode,
        scope_region_name: project.scope_region_name,
        scope_country_name: project.scope_country_name,
        status: project.status,
        updated_at: project.updated_at
      }
    end

    def layers_data
      {
        bahai_clusters: serialize_bahai_clusters,
        bahai_zones: serialize_bahai_zones,
        states: serialize_states,
        bahai_regions: serialize_bahai_regions,
        regions: serialize_regions,
        countries: serialize_countries
      }
    end

    def serialize_bahai_clusters
      records = BahaiCluster.includes(bahai_zone: :region)

      if project.scope_mode == 'region' && project.scope_region_name.present?
        records = records.joins(bahai_zone: :region).where(regions: { name: project.scope_region_name })
      end

      ActiveModelSerializers::SerializableResource.new(records, each_serializer: BahaiClusterSerializer).as_json
    end

    def serialize_bahai_zones
      records = BahaiZone.includes(:region)

      if project.scope_mode == 'region' && project.scope_region_name.present?
        records = records.joins(:region).where(regions: { name: project.scope_region_name })
      end

      ActiveModelSerializers::SerializableResource.new(records, each_serializer: BahaiZoneSerializer).as_json
    end

    def serialize_states
      records = State.all

      if project.scope_mode == 'region' && project.scope_region_name.present?
        records = records.joins(:region).where(regions: { name: project.scope_region_name }).or(State.where(name: 'Tocantins'))
      end

      ActiveModelSerializers::SerializableResource.new(records, each_serializer: StateSerializer).as_json
    end

    def serialize_bahai_regions
      records = BahaiRegion.all
      ActiveModelSerializers::SerializableResource.new(records, each_serializer: BahaiRegionSerializer).as_json
    end

    def serialize_regions
      records = Region.all

      if project.scope_mode == 'region' && project.scope_region_name.present?
        records = records.where(name: project.scope_region_name)
      end

      ActiveModelSerializers::SerializableResource.new(records, each_serializer: RegionSerializer).as_json
    end

    def serialize_countries
      records = Country.all

      if project.scope_mode == 'country' && project.scope_country_name.present?
        records = records.where(name: project.scope_country_name)
      end

      ActiveModelSerializers::SerializableResource.new(records, each_serializer: CountrySerializer).as_json
    end

    def serialize_legends
      ActiveModelSerializers::SerializableResource.new(
        project.project_legends.order(:sort_order),
        each_serializer: ProjectLegendSerializer
      ).as_json
    end
  end
end
