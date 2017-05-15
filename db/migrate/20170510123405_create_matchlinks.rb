class CreateMatchlinks < ActiveRecord::Migration[5.0]
  def change
    create_table :matchlinks do |t|
      t.belongs_to :match, index: true
      t.belongs_to :user, index: true
      t.string :type

      t.timestamps
    end
  end
end
