class ZoneSerializer < ActiveModel::Serializer
  attributes :id, :name, :region

  def region
    {
      id: object.region&.id,
      name: object.region&.name
    }
  end
end
