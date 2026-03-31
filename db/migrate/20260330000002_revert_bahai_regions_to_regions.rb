class RevertBahaiRegionsToRegions < ActiveRecord::Migration[7.0]
  def change
    # Revert regions rename - Region is an official Brazilian concept
    rename_table :bahai_regions, :regions

    # Revert FK column renames for regions
    rename_column :bahai_zones, :bahai_region_id, :region_id
    rename_column :states, :bahai_region_id, :region_id
  end
end
