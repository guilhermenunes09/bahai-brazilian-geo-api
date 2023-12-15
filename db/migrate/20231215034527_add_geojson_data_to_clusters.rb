class AddGeojsonDataToClusters < ActiveRecord::Migration[7.0]
  def change
    add_column :clusters, :geojson_data, :jsonb
  end
end
