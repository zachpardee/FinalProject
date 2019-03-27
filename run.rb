require_relative "./config/environment"
def play_game
  PlayerCharacter.destroy_all #Clear all prior draft picks
  # Set number draft picks
  number_of_draft_picks = 1
  number_of_draft_picks.times do
    list_all_players
    puts "\nPlease enter your name: "
    #if response = admin, enter admin console to kill characters, add players, etc.
    response = gets.chomp
    player = Player.find_by(name:response)
    Character.all.each do |character|
      puts character.name
    end
    puts "\nEnter your character selection: "
    character = gets.chomp()
    puts "alive or dead?"
    dead_or_alive = gets.chomp
    PlayerCharacter.create(
      player: player,
      character: Character.find_by(name:character),
      predictedstatus: dead_or_alive)
  end
end

def list_all_players
  Player.all.each do |player|
    puts player.name
  end
end

def display_scores
  Player.display_player_scores
end

def admin_kill_character
  puts "Please enter the character you wish to die."
  dead_character = gets.chomp()
  Character.kill_character(dead_character)
end


# add api to set status of characters

play_game

binding.pry
