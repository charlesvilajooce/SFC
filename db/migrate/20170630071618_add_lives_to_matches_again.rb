class AddLivesToMatchesAgain < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :live, :boolean
  end
end
