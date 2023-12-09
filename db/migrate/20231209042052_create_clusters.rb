# db/migrate/xxxxxx_create_clusters.rb
class CreateClusters < ActiveRecord::Migration[7.0]
  def change
    create_table :clusters do |t|
      t.string :name
      t.references :conjunto, foreign_key: true
      t.timestamps
    end
  end
end
