class Addrolefieldtouser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :canrole, :string
  end
end
