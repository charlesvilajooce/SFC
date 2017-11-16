class CreateMatcheventlinks < ActiveRecord::Migration[5.0]
  def change
    create_table :matcheventlinks do |t|


      t.belongs_to :match, index: true
      t.integer :imageable_id
      t.string  :imageable_type
      t.integer :theorder
      t.integer :temps

      t.timestamps
    end
    add_index :matcheventlinks, [:imageable_type, :imageable_id]
  end
end


