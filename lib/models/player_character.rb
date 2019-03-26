class PlayerCharacter < ActiveRecord::Base
  belongs_to :player
  belongs_to :character



  def draft_player(player, character, predictedstatus)
     PlayerCharacter.create(player: player, character: character)
   end

  def calculate_total_score(player: player)
    player_characters_array = PlayerCharacter.where(player: player)
    player_characters_array.select do |playercharacter| playercharacter.predictedstatus == "alive"
      self.player.score += 1
    end
    player_characters_array.select do |playercharacter| playercharacter.predictedstatus == "dead"
      self.player.score -= 1
    end
  end

end
