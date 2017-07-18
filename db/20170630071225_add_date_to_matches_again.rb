class AddDateToMatchesAgain < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :when, :bigint
  end
end
