class AddClusterIdToCities < ActiveRecord::Migration[7.0]
  def change
    add_reference :cities, :cluster, foreign_key: true
  end
end
