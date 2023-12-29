class ClusterSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :name, :milestone, :zone, :active, :geojson_data

  def zone
    {
      id: object.zone&.id,
      name: object.zone&.name
    }
  end
end
