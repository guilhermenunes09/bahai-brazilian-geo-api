class ClusterSerializer < ActiveModel::Serializer
  attributes :id, :name, :milestone, :zone, :geojson_data

  def zone
    {
      id: object.zone&.id,
      name: object.zone&.name
    }
  end
end
