class Region < ApplicationRecord
  has_many :states, dependent: :destroy
end