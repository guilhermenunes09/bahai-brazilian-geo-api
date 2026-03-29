module Projects
  class MapBundleBuilder
    def initialize(project)
      @project = project
    end

    def call
      {
        project: project_payload,
        config: project.merged_config,
        layersData: layers_data
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
        clusters: layer_active?('clusters') ? serialize_clusters : [],
        zones: layer_active?('zones') ? serialize_zones : [],
        states: layer_active?('states') ? serialize_states : [],
        regions: layer_active?('regions') ? serialize_regions : [],
        countries: layer_active?('countries') ? serialize_countries : []
      }
    end

    def layer_active?(layer_slug)
      project.merged_config.dig('layers', layer_slug, 'visible') == true
    end

    def serialize_clusters
      records = Cluster.includes(zone: :region)

      if project.scope_mode == 'region' && project.scope_region_name.present?
        records = records.joins(zone: :region).where(regions: { name: project.scope_region_name })
      end

      ActiveModelSerializers::SerializableResource.new(records, each_serializer: ClusterSerializer).as_json
    end

    def serialize_zones
      records = Zone.includes(:region)

      if project.scope_mode == 'region' && project.scope_region_name.present?
        records = records.joins(:region).where(regions: { name: project.scope_region_name })
      end

      ActiveModelSerializers::SerializableResource.new(records, each_serializer: ZoneSerializer).as_json
    end

    def serialize_states
      records = State.all

      if project.scope_mode == 'region' && project.scope_region_name.present?
        records = records.joins(:region).where(regions: { name: project.scope_region_name }).or(State.where(name: 'Tocantins'))
      end

      ActiveModelSerializers::SerializableResource.new(records, each_serializer: StateSerializer).as_json
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
  end
end
