class StateSerializer < ActiveModel::Serializer
  attributes :id, :name, :milestone, :geojson_data

  def milestone
    [0,1,2,3,4].sample
  end
end
