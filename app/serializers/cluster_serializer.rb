class ClusterSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :name, :milestone, :zone, :active, :geojson_data

  def zone
    {
      id: object.zone&.id,
      name: object.zone&.name,
      region: {
        id: object.zone&.region&.id,
        name: object.zone&.region&.name
      }
    }
  end

  def geojson_data
    object.geojson_data || object.zone&.geojson_data
  end
end
