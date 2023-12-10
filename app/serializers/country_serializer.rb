class CountrySerializer < ActiveModel::Serializer
  attributes :id, :name, :geojson_data
end
