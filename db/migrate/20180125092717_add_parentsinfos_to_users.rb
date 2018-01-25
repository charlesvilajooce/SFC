class AddParentsinfosToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nomprenompere, :string
    add_column :users, :nomprenommere, :string
    add_column :users, :mailpere, :string
    add_column :users, :mailmere, :string
    add_column :users, :prixcotisations, :string
    add_column :users, :remarquesgenerales, :string
    add_column :users, :lieunaissance, :string
    add_column :users, :telportablejoueur, :string
  end
end