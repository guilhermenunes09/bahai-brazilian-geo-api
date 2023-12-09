class Cluster < ApplicationRecord
  belongs_to :zone
  has_many :cities

  enum milestone: {
    incipient: 0,
    one: 1,
    two: 2,
    three: 3,
    frontiers: 4
  }
end
