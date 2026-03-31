class RenameToBahaiResources < ActiveRecord::Migration[7.0]
  def change
    # Rename tables
    rename_table :clusters, :bahai_clusters
    rename_table :zones, :bahai_zones
    rename_table :regions, :bahai_regions

    # Rename FK columns to match new association names
    rename_column :bahai_clusters, :zone_id, :bahai_zone_id
    rename_column :bahai_zones, :region_id, :bahai_region_id
    rename_column :cities, :cluster_id, :bahai_cluster_id
    rename_column :states, :region_id, :bahai_region_id
  end
end
