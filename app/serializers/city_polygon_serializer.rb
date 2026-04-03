class CityPolygonSerializer < ActiveModel::Serializer
  attributes :id, :geojson_data
end
