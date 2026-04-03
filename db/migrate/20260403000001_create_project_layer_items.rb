class CreateProjectLayerItems < ActiveRecord::Migration[7.0]
  def change
    create_table :project_layer_items do |t|
      t.bigint  :project_id,  null: false
      t.string  :layer_slug,  null: false
      t.string  :item_type,   null: false
      t.bigint  :item_id,     null: false
      t.integer :sort_order,  null: false, default: 0

      t.timestamps
    end

    add_index :project_layer_items, [:project_id, :layer_slug]
    add_index :project_layer_items, [:item_type, :item_id]
    add_foreign_key :project_layer_items, :projects, on_delete: :cascade
  end
end
