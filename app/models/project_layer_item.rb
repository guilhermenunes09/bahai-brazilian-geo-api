class ProjectLayerItem < ApplicationRecord
  VALID_ITEM_TYPES = %w[bahai_clusters].freeze
  VALID_LAYER_SLUGS = %w[bahai_clusters].freeze

  belongs_to :project

  validates :layer_slug, presence: true, inclusion: { in: VALID_LAYER_SLUGS }
  validates :item_type,  presence: true, inclusion: { in: VALID_ITEM_TYPES }
  validates :item_id,    presence: true
end
