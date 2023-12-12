class ZoneSerializer < ActiveModel::Serializer
  attributes :id, :name, :region, :geojson_data

  def region
    {
      id: object.region&.id,
      name: object.region&.name
    }
  end
end
