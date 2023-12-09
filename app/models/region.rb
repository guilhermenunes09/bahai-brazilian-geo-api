class Region < ApplicationRecord
  has_many :states, dependent: :destroy
  has_many :zones, dependent: :destroy
end