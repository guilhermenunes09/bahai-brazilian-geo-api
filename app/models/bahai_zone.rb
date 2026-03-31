class BahaiZone < ApplicationRecord
  belongs_to :region
  has_many :bahai_clusters, dependent: :destroy
end
