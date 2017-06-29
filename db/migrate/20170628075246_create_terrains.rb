class CreateTerrains < ActiveRecord::Migration[5.0]
  def change
    create_table :terrains do |t|
      t.string :name
      t.integer :category

      t.timestamps
    end
  end
end
