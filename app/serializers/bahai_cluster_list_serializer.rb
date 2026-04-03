class BahaiClusterListSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :name, :milestone, :active, :bahai_zone

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
end
