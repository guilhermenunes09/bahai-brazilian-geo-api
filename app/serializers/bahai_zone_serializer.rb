class BahaiZoneSerializer < ActiveModel::Serializer
  attributes :id, :name, :region, :geojson_data, :unified_geojson_data, :clusters

  def region
    {
      id: object.region&.id,
      name: object.region&.name
    }
  end

  # Build geojson_data dynamically from all cities of all clusters.
  # Falls back to the stored geojson_data when no cities are assigned yet.
  def geojson_data
    features = object.bahai_clusters.flat_map do |cluster|
      cluster.cities.filter_map do |city|
        next unless city.geojson_data.present?
        city.geojson_data['features']
      end.flatten
    end

    if features.any?
      { 'type' => 'FeatureCollection', 'features' => features }
    else
      object.geojson_data
    end
  end

  def clusters
    object.bahai_clusters.map do |cluster|
      {
        id: cluster.id,
        name: cluster.name,
        cities: cluster.cities.map { |c| { id: c.id, geojson_data: c.geojson_data } }
      }
    end
  end
end
