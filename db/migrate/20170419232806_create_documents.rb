class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.belongs_to :user, index: true
      t.integer :documenttype
      t.string :url
      t.string :name

      t.timestamps
    end
  end
end
