class Character < ActiveRecord::Base
  has_many :player_characters
  has_many :players, through: :player_characters


  def view_players_who_drafted
    players_who_drafted = []
      PlayerCharacter.all.select do |draftpick|
        if(draftpick.character.name == self.name)
          players_who_drafted << draftpick.player.name
        end
      end
      players_who_drafted
  end

  def self.kill_character(character_name)
    Character.all.select do |character|
      if (character.name == character_name)
        Character.update(character.id, status: "dead")
      end
    end
  end

  def self.revive_character(character_name)
    Character.all.select do |character|
      if (character.name == character_name)
        Character.update(character.id, status: "alive")
      end
    end
  end

end
