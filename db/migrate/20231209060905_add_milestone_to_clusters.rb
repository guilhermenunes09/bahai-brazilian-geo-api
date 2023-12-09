class AddMilestoneToClusters < ActiveRecord::Migration[6.0]
  def change
    add_column :clusters, :milestone, :integer, default: 0
  end
end
