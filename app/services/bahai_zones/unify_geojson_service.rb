module BahaiZones
  class UnifyGeojsonService
    def initialize(zone)
      @zone = zone
    end

    def call
      features = collect_features
      return false if features.empty?

      factory = RGeo::Geos.factory(srid: 4326)

      geometries = features.filter_map do |feature|
        geom_hash = feature['geometry']
        next unless geom_hash

        begin
          RGeo::GeoJSON.decode(feature.to_json, geo_factory: factory)&.geometry
        rescue StandardError
          nil
        end
      end

      return false if geometries.empty?

      union_geom = geometries.reduce { |acc, g| safe_union(acc, g) }
      return false unless union_geom

      encoded = RGeo::GeoJSON.encode(union_geom)
      unified = {
        'type'     => 'FeatureCollection',
        'features' => [
          { 'type' => 'Feature', 'geometry' => encoded, 'properties' => {} }
        ]
      }

      zone.update_column(:unified_geojson_data, unified)
      true
    end

    private

    attr_reader :zone

    def collect_features
      zone.bahai_clusters.flat_map do |cluster|
        cluster.cities.filter_map do |city|
          next unless city.geojson_data.present?
          city.geojson_data['features']
        end.flatten
      end
    end

    def safe_union(geom_a, geom_b)
      geom_a.union(geom_b)
    rescue StandardError
      geom_a
    end
  end
end
