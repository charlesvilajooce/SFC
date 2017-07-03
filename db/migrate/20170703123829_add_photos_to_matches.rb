class AddPhotosToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :photos, :string
    add_column :matches, :videos, :string
  end
end
