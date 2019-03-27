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

end
