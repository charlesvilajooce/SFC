class AddAliasToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :alias, :string

  end
end
