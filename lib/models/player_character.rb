class PlayerCharacter < ActiveRecord::Base
  belongs_to :player
  belongs_to :character

  # 
  # def inspect
  #   "Player: #{self.player.name}, \nCharacter: #{self.character.name}, \nPredicted Status: #{self.predictedstatus}"
  # end
  #


end
