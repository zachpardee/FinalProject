class Player < ActiveRecord::Base
  has_many :player_characters
  has_many :characters, through: :player_characters


  def self.calc_score
    Player.all.map do |player|
      Player.update(player.id, score: 0)
    end
    PlayerCharacter.all.map do |draftpick|
      if(draftpick.character.status == draftpick.predictedstatus)
        Player.update(draftpick.player.id, score: draftpick.player.score+1)
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
      puts charactersDrafted
  end

  def self.display_player_scores
    Player.calc_score
    Player.all.each do |player|
      puts player.name + "'s Score is: " + player.score.to_s
    end
  end
end
