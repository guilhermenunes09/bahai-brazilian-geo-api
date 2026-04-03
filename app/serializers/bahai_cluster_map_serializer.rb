class BahaiClusterMapSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :name, :milestone, :active, :geojson_data

  attribute :bahai_zone do
    {
      id: object.bahai_zone&.id,
      name: object.bahai_zone&.name,
      region: {
        id: object.bahai_zone&.region&.id,
        name: object.bahai_zone&.region&.name
      }
    }
  end

  has_many :cities, serializer: CityPolygonSerializer
end
