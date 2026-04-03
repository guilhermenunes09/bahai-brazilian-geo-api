class AddUniqueIndexToProjectLayerItems < ActiveRecord::Migration[7.0]
  def change
    add_index :project_layer_items, [:project_id, :item_type, :item_id],
              unique: true,
              name: 'index_project_layer_items_unique_per_project'
  end
end
