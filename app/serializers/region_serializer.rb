class RegionSerializer < ActiveModel::Serializer
  attributes :id, :name, :geojson_data
end
