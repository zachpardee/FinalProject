class Player < ActiveRecord::Base
  has_many :player_characters
  has_many :characters, through: :player_characters


  def calc_score
  PlayerCharacter.all.select do |draftpick|
    if(draftpick.player.name == self.name)
        if (draftpick.predictedstatus == Character.find_by(name:draftpick.character.name).status)
          self.score += 1
          save self
        end
      end
    end
  end


  def view_characters_drafted
    charactersDrafted = []
      PlayerCharacter.all.select do |draftpick|
        if(draftpick.player.name == self.name)
          charactersDrafted << draftpick.character.name
        end
      end
      charactersDrafted
  end

  def display_player_scores

  end

end
