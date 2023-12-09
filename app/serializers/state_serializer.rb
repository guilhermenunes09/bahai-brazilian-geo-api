class StateSerializer < ActiveModel::Serializer
  attributes :id, :name, :geojson_data
  belongs_to :region
  has_many :cities
end