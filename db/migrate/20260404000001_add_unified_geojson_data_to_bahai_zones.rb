class AddUnifiedGeojsonDataToBahaiZones < ActiveRecord::Migration[7.0]
  def change
    add_column :bahai_zones, :unified_geojson_data, :jsonb
  end
end
