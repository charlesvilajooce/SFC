class AddAddressesToTerrains < ActiveRecord::Migration[5.0]
  def change
    add_column :terrains, :street, :string
    add_column :terrains, :city, :string
    add_column :terrains, :zip, :string
  end
end
