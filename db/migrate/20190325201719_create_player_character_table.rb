class CreatePlayerCharacterTable < ActiveRecord::Migration[5.2]
  def change
    create_table :player_characters do |t|
      t.references :player
      t.references :character
      t.text :predictedstatus
    end
  end
end
