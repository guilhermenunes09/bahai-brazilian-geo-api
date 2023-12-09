# db/migrate/xxxxxxxxxxxxxx_create_cities.rb
class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :regions do |t|
      t.string :name

      t.timestamps
    end

    create_table :states do |t|
      t.string :name
      t.text :geojson_data
      t.references :region, foreign_key: true

      t.timestamps
    end

    create_table :cities do |t|
      t.string :name
      t.text :geojson_data
      t.references :state, foreign_key: true

      t.timestamps
    end
  end
end
