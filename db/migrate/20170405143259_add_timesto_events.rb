class AddTimestoEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :begin, :bigint
    add_column :events, :end, :bigint
  end
end
