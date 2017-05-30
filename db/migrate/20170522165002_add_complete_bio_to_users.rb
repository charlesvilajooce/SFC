class AddCompleteBioToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :height, :integer
    add_column :users, :weight, :integer
    add_column :users, :nationalityfrom, :date
    add_column :users, :nationality2, :string
    add_column :users, :nationality2from, :date
    add_column :users, :nationality3, :string
    add_column :users, :nationality3from, :date
    add_column :users, :naturalisationinprocess, :boolean
    add_column :users, :nationalisationinprocessfrom, :date
    add_column :users, :insurance, :string
    add_column :users, :mothercontact, :string
    add_column :users, :fathercontact, :string
    add_column :users, :numberofsiblings, :integer
  end
end
