class AddDatesToInjuries < ActiveRecord::Migration[5.0]
  def change
    add_column :injuries, :when, :bigint
    add_column :injuries, :datetrain, :bigint
    add_column :injuries, :datematch, :bigint
    add_column :injuries, :dateperf, :bigint
  end
end
