class AddHomeToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :home, :boolean
  end
end
