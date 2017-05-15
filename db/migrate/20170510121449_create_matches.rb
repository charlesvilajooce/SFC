class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :équipe
      t.string :adversaire
      t.string :saison
      t.integer :scoreSfc
      t.integer :scoreAdv
      t.string :spectateurs
      t.string :competition
      t.string :terrain
      t.string :hometitulaires
      t.string :homeremplacants
      t.string :homeentrainer
      t.string :homeabsents
      # t.awaybuts :string
      # t.awayavertissement :string
      # t.awayexpulsions :string
      t.string :awaytitulaires
      t.string :awayremplacants
      t.string :awayentrainer
      t.string :awayabsents



      t.timestamps
    end
  end
end
