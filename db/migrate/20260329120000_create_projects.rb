class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :scope_mode, null: false, default: 'region'
      t.string :scope_region_name
      t.string :scope_country_name
      t.string :status, null: false, default: 'active'
      t.jsonb :config, null: false, default: {}

      t.timestamps
    end

    add_index :projects, :slug, unique: true
    add_index :projects, :scope_mode
    add_index :projects, :scope_region_name
  end
end
