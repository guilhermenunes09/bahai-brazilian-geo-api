class ProjectLayerItem < ApplicationRecord
  VALID_LAYER_SLUGS = %w[bahai_clusters bahai_zones states bahai_regions regions countries].freeze
  VALID_ITEM_TYPES  = VALID_LAYER_SLUGS.freeze

  belongs_to :project

  validates :layer_slug, presence: true, inclusion: { in: VALID_LAYER_SLUGS }
  validates :item_type,  presence: true, inclusion: { in: VALID_ITEM_TYPES }
  validates :item_id,    presence: true
  validates :item_id,    uniqueness: { scope: [:project_id, :item_type], message: 'already added to this project' }
end
