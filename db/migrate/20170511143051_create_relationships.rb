class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.belongs_to :user_one, index: true
      t.belongs_to :user_two, index: true

      t.timestamps
    end
  end
end
