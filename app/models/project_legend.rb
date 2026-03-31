class ProjectLegend < ApplicationRecord
  belongs_to :project

  validates :name, presence: true
  validates :color, presence: true, format: { with: /\A#[0-9a-fA-F]{3,6}\z/, message: 'must be a hex color' }
  validates :sort_order, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
