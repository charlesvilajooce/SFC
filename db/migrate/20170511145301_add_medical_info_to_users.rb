class AddMedicalInfoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :status, :integer
    add_column :users, :status2, :string
    add_column :users, :allergies, :string
    add_column :users, :medication, :string
    add_column :users, :statictrouble, :string
  end
end
