class Region < ApplicationRecord
  has_many :states, dependent: :destroy
  has_many :bahai_zones, dependent: :destroy
end