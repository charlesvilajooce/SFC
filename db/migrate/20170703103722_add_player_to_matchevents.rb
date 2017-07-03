class AddPlayerToMatchevents < ActiveRecord::Migration[5.0]
  def change
    add_column :matchevents, :player, :string
  end
end
