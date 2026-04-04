class AddUnifiedGeojsonDataToBahaiClusters < ActiveRecord::Migration[7.0]
  def change
    add_column :bahai_clusters, :unified_geojson_data, :jsonb
  end
end
