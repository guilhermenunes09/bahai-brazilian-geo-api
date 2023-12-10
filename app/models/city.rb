class City < ApplicationRecord
  belongs_to :state, optional: true
end
