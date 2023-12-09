class CreateConjuntos < ActiveRecord::Migration[7.0]
  def change
    create_table :conjuntos do |t|
      t.string :name
      t.references :region, foreign_key: true
      t.timestamps
    end
  end
end
