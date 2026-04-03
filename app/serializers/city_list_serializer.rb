class CityListSerializer < ActiveModel::Serializer
  attributes :id, :name, :state, :region

  def state
    {
      id: object.state&.id,
      name: object.state&.name
    }
  end

  def region
    {
      id: object.state&.region&.id,
      name: object.state&.region&.name
    }
  end
end
