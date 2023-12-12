class AddGeoGsonToZones < ActiveRecord::Migration[7.0]
  def change
    add_column :zones, :geojson_data, :jsonb
  end
end
