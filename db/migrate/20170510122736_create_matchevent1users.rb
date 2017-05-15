class CreateMatchevent1users < ActiveRecord::Migration[5.0]
  def change
    create_table :matchevent1users do |t|
      t.belongs_to :match, index: true
      t.belongs_to :user, index: true
      t.integer :temps
      t.string :type
      t.string :commentaire

      t.timestamps
    end
  end
end
