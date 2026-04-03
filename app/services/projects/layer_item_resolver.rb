module Projects
  class LayerItemResolver
    SERIALIZER_MAP = {
      'bahai_clusters' => BahaiClusterMapSerializer,
      'bahai_zones'    => BahaiZoneSerializer,
      'states'         => StateSerializer,
      'bahai_regions'  => BahaiRegionSerializer,
      'regions'        => RegionSerializer,
      'countries'      => CountrySerializer,
    }.freeze

    # Resolve a single ProjectLayerItem into a serialized hash ready for the frontend.
    # Merges project_layer_item_id so the frontend knows which DB row to DELETE on remove.
    def self.resolve(layer_item)
      new(layer_item).resolve
    end

    def initialize(layer_item)
      @layer_item = layer_item
    end

    def resolve
      record = load_record
      return nil unless record

      serializer = SERIALIZER_MAP[layer_item.item_type]
      return nil unless serializer

      ActiveModelSerializers::SerializableResource
        .new(record, serializer: serializer)
        .as_json
        .merge('project_layer_item_id' => layer_item.id)
    end

    private

    attr_reader :layer_item

    def load_record
      klass = layer_item.item_type.classify.constantize
      case layer_item.item_type
      when 'bahai_clusters'
        klass.includes(:cities, bahai_zone: :region).find_by(id: layer_item.item_id)
      when 'bahai_zones'
        klass.includes(:region).find_by(id: layer_item.item_id)
      else
        klass.find_by(id: layer_item.item_id)
      end
    end
  end
end
