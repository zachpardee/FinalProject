class Player < ActiveRecord::Base
  has_many :player_characters
  has_many :characters, through: :player_characters

  # def calculate_total_score
  #   self.score = 0
  #   player_characters_array = PlayerCharacter.where(player: self)
  #   player_characters_array.select do |playercharacter|
  #     playercharacter.predictedstatus == playercharacter.character.status
  #     return self.player.score += 1
  #   end
  #   # player_characters_array.select do |playercharacter|
  #   #   playercharacter.predictedstatus == "dead"
  #   #   self.player.score -= 1
  #   # end
  # end

  def calc_score
  PlayerCharacter.all.select do |draftpick|
    draftpick.player == self
      if (draftpick.predictedstatus == Character.find_by(name:draftpick.character.name).status)
        self.score += 1
        return self.score
      end
    end
  end

end
