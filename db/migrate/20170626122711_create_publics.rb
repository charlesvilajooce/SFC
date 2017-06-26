class CreatePublics < ActiveRecord::Migration[5.0]
  def change
    create_table :publics do |t|

      t.timestamps
    end
  end
end
