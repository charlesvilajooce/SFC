class CreateAvatars < ActiveRecord::Migration[5.0]
  def change
    create_table :avatars do |t|
      t.belongs_to :user, index: true
      t.string :url
      t.boolean :active

      t.timestamps
    end
  end
end
