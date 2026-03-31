class CreateProjectLegends < ActiveRecord::Migration[7.0]
  def change
    create_table :project_legends do |t|
      t.references :project, null: false, foreign_key: true
      t.string :name, null: false
      t.string :color, null: false, default: '#ffffff'
      t.integer :sort_order, null: false, default: 0
      t.jsonb :rules, null: false, default: []

      t.timestamps
    end
  end
end
