class AddGeojsonDataToRegions < ActiveRecord::Migration[7.0]
  def change
    add_column :regions, :geojson_data, :jsonb
  end
end
