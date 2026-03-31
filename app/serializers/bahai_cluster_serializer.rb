class BahaiClusterSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :name, :milestone, :bahai_zone, :active, :geojson_data

  def bahai_zone
    {
      id: object.bahai_zone&.id,
      name: object.bahai_zone&.name,
      region: {
        id: object.bahai_zone&.region&.id,
        name: object.bahai_zone&.region&.name
      }
    }
  end

  def geojson_data
    object.geojson_data || object.bahai_zone&.geojson_data
  end
end
