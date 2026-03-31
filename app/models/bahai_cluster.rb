class BahaiCluster < ApplicationRecord
  belongs_to :bahai_zone, optional: true
  has_many :cities, dependent: :destroy

  enum milestone: {
    virgem: -1,
    incipient: 0,
    one: 1,
    two: 2,
    three: 3,
    frontiers: 4
  }
end
