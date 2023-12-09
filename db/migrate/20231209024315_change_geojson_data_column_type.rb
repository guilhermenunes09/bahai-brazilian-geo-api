class ChangeGeojsonDataColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :cities, :geojson_data, :jsonb, using: 'CAST(geojson_data AS jsonb)'
    change_column :states, :geojson_data, :jsonb, using: 'CAST(geojson_data AS jsonb)'
  end
end
