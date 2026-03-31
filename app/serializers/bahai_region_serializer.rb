class BahaiRegionSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :geojson_data
end
