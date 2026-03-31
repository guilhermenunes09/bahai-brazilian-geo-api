class ProjectLegendSerializer < ActiveModel::Serializer
  attributes :id, :name, :color, :sort_order, :rules
end
