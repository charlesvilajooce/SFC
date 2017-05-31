class CreateArchivedInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :archived_infos do |t|
      t.belongs_to :user, index: true
      t.string :content
      t.string :fieldtype

      t.timestamps
    end
  end
end
