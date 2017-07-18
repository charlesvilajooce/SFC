class AddCompterenduToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :compterendu, :string
  end
end
