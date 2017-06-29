class CreateMatchevent2users < ActiveRecord::Migration[5.0]
  def change
    create_table :matchevent2users do |t|
      t.belongs_to :match, index: true
      t.belongs_to :user_one, index: true
      t.belongs_to :user_two, index: true
      t.integer :temps
      t.string :thetype
      t.string :commentaire

      t.timestamps
    end
  end
end
