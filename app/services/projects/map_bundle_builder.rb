module Projects
  class MapBundleBuilder
    # These layers always include ALL records — no per-item curation needed.
    BULK_LAYERS = {
      'states'        => -> { State.all },
      'bahai_zones'   => -> { BahaiZone.includes(:region).all },
      'bahai_regions' => -> { BahaiRegion.all },
      'regions'       => -> { Region.all },
      'countries'     => -> { Country.all },
    }.freeze

    BULK_SERIALIZERS = {
      'states'        => StateSerializer,
      'bahai_zones'   => BahaiZoneSerializer,
      'bahai_regions' => BahaiRegionSerializer,
      'regions'       => RegionSerializer,
      'countries'     => CountrySerializer,
    }.freeze

    def initialize(project)
      @project = project
    end

    def call
      {
        project:    project_payload,
        config:     project.merged_config,
        layerItems: assemble_layer_items,
        legends:    serialize_legends
      }
    end

    private

    attr_reader :project

    def project_payload
      {
        id:                  project.id,
        name:                project.name,
        slug:                project.slug,
        scope_mode:          project.scope_mode,
        scope_region_name:   project.scope_region_name,
        scope_country_name:  project.scope_country_name,
        status:              project.status,
        updated_at:          project.updated_at
      }
    end

    def assemble_layer_items
      result = bulk_layer_items
      result['bahai_clusters'] = curated_cluster_items
      result
    end

    # Bulk layers: always load all records, serialize with their standard serializer.
    def bulk_layer_items
      BULK_LAYERS.each_with_object({}) do |(slug, loader), hash|
        serializer = BULK_SERIALIZERS[slug]
        records    = loader.call
        hash[slug] = ActiveModelSerializers::SerializableResource
          .new(records, each_serializer: serializer)
          .as_json
      end
    end

    # Curated layer: only items explicitly added to this project via project_layer_items.
    def curated_cluster_items
      items = project.project_layer_items
        .where(layer_slug: 'bahai_clusters', item_type: 'bahai_clusters')
        .order(:sort_order)
      return [] if items.empty?

      ids    = items.map(&:item_id)
      loaded = BahaiCluster.where(id: ids).index_by(&:id)
      li_map = items.index_by(&:item_id)

      ids.filter_map do |item_id|
        record = loaded[item_id]
        next unless record

        li = li_map[item_id]
        ActiveModelSerializers::SerializableResource
          .new(record, serializer: BahaiClusterMapSerializer)
          .as_json
          .merge('project_layer_item_id' => li.id)
      end
    end

    def serialize_legends
      ActiveModelSerializers::SerializableResource.new(
        project.project_legends.order(:sort_order),
        each_serializer: ProjectLegendSerializer
      ).as_json
    end
  end
end
