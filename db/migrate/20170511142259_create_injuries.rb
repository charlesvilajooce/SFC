class CreateInjuries < ActiveRecord::Migration[5.0]
  def change
    create_table :injuries do |t|
      t.belongs_to :user, index: true
      t.string :location
      t.string :structure
      t.string :comment

      t.timestamps
    end
  end
end
