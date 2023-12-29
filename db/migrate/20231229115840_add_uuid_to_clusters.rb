class AddUuidToClusters < ActiveRecord::Migration[7.0]
  def change
    add_column :clusters, :uuid, :string

    Cluster.all.each do |cluster|
      cluster.update(uuid: SecureRandom.uuid)
    end

    change_column_null :clusters, :uuid, false
    add_index :clusters, :uuid, unique: true
  end
end
