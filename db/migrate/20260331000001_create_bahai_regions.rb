class CreateBahaiRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :bahai_regions do |t|
      t.string :name, null: false
      t.string :slug
      t.jsonb :geojson_data

      t.timestamps
    end

    add_index :bahai_regions, :slug, unique: true
  end
end
