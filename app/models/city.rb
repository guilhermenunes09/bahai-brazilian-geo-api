class City < ApplicationRecord
  belongs_to :state, optional: true
  belongs_to :bahai_cluster, optional: true
end
