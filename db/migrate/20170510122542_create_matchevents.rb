class CreateMatchevents < ActiveRecord::Migration[5.0]
  def change
    create_table :matchevents do |t|
      t.belongs_to :match, index: true
      t.integer :temps
      t.string :type
      t.string :commentaire

      t.timestamps
    end
  end
end
