class Cluster < ApplicationRecord
  belongs_to :zone
  has_many :cities
end
