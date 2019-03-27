class PlayerCharacter < ActiveRecord::Base
  belongs_to :player
  belongs_to :character


  def inspect
    "Player: #{self.player.name}, Character: #{self.character.name}, Predicted Status: #{self.predictedstatus}"
  end
end
