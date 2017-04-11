class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|

      t.belongs_to :user, index: true
      t.belongs_to :event, index: true
      t.integer :presense
      t.timestamps

    end
  end
end
