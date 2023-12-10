class Zone < ApplicationRecord
  belongs_to :region
  has_many :clusters, dependent: :destroy
end
