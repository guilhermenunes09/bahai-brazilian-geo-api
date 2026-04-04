module Projects
  class MapBundleBuilder
    LAYER_ORDER = %w[bahai_clusters bahai_zones states bahai_regions regions countries].freeze

    SERIALIZER_MAP = {
      'bahai_clusters' => BahaiClusterMapSerializer,
      'bahai_zones'    => BahaiZoneSerializer,
      'states'         => StateSerializer,
      'bahai_regions'  => BahaiRegionSerializer,
      'regions'        => RegionSerializer,
      'countries'      => CountrySerializer,
    }.freeze

    # Eager-load associations needed per type
    LOADER_MAP = {
      'bahai_clusters' => ->(ids) { BahaiCluster.includes(:cities, bahai_zone: :region).where(id: ids) },
      'bahai_zones'    => ->(ids) { BahaiZone.includes(:region, bahai_clusters: :cities).where(id: ids) },
      'states'         => ->(ids) { State.includes(:region).where(id: ids) },
      'bahai_regions'  => ->(ids) { BahaiRegion.where(id: ids) },
      'regions'        => ->(ids) { Region.where(id: ids) },
      'countries'      => ->(ids) { Country.where(id: ids) },
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
      # Start with empty arrays in canonical order
      result = LAYER_ORDER.each_with_object({}) { |slug, h| h[slug] = [] }

      # Group project_layer_items by layer_slug
      all_items = project.project_layer_items.order(:sort_order)
      by_slug = all_items.group_by(&:layer_slug)

      by_slug.each do |slug, items|
        serializer = SERIALIZER_MAP[slug]
        loader     = LOADER_MAP[slug]
        next unless serializer && loader

        # Deduplicate by item_id, keep first
        li_map = {}
        items.each { |li| li_map[li.item_id] ||= li }

        loaded = loader.call(li_map.keys).index_by(&:id)

        result[slug] = li_map.keys.filter_map do |item_id|
          record = loaded[item_id]
          next unless record

          ActiveModelSerializers::SerializableResource
            .new(record, serializer: serializer)
            .as_json
            .merge('project_layer_item_id' => li_map[item_id].id)
        end
      end

      # Resolve custom layers stored in project config
      custom_layers = project.merged_config['customLayers'] || []
      custom_layers.each do |custom_layer|
        slug  = custom_layer['slug']
        items = custom_layer['items'] || []
        result[slug] = resolve_custom_items(items)
      end

      result
    end

    def resolve_custom_items(items)
      items.filter_map do |item_ref|
        type = item_ref['type']
        id   = item_ref['id']
        serializer = SERIALIZER_MAP[type]
        loader     = LOADER_MAP[type]
        next unless serializer && loader

        record = loader.call([id]).first
        next unless record

        ActiveModelSerializers::SerializableResource
          .new(record, serializer: serializer)
          .as_json
          .merge('_itemType' => type)
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
