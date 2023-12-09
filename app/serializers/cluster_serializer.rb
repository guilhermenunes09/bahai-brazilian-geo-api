class ClusterSerializer < ActiveModel::Serializer
  attributes :id, :name, :zone

  def zone
    {
      id: object.zone&.id,
      name: object.zone&.name
    }
  end
end
