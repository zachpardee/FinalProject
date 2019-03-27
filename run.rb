require_relative "./config/environment"

def play_game

  puts "Menu: \n
  New Draft
  Admin
  View Current Players
  View Current Characters
  View Current Player Scores
  View Current Draft Picks
  Exit\n\n"

  puts "Select a Menu Item: "

  response = gets.chomp

  case response.downcase
  when "New Draft"
    PlayerCharacter.destroy_all #Clear all prior draft picks
    # Set number draft picks
    number_of_draft_picks = 1
    number_of_draft_picks.times do
      draft_a_character
    end
  when "admin"
    binding.pry
  when "view current players"
    list_all_players
  when "view current characters"
    list_all_characters
  when "view current player scores"
    display_scores
  when "view current draft picks"
    view_all_draft_picks
  when "exit"
    return
  end
  play_game
end

def draft_a_character
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


def list_all_players
  Player.all.each do |player|
    puts player.name
  end
end

def list_all_characters
  Character.all.each do |character|
    puts character.name
  end
end

def display_scores
  Player.display_player_scores
end

def view_all_draft_picks
  PlayerCharacter.all.each do |draftpick|
    puts "Player name: #{draftpick.player.name}
     Character selection: #{draftpick.character.name}
     Predicted Status: #{draftpick.predictedstatus}"
  end
end

def admin_create_player
  puts "Please enter the name you wish to add to the game:"
  user_input = gets.chomp
  Player.create(name: user_input, score: 0)
end

def admin_delete_player
  list_all_players
  puts "Please enter the name of the player you wish to delete:"
  user_input = gets.chomp()
  Player.find_by(name: user_input).destroy
end

def admin_kill_character
  puts "Please enter the character you wish to die."
  dead_character = gets.chomp
  Character.kill_character(dead_character)
end


def admin_delete_character
  list_all_characters
  puts "Please enter the character you wish to remove from the game"
  user_input = gets.chomp
  Character.find_by(name: user_input).destroy
end

def admin_create_character
  puts "Please enter the character you wish to create"
  new_character = gets.chomp
  puts "Please enter the current status of the character.. alive or dead preferebly"
  new_status = gets.chomp
  Character.create(name: new_character, status: new_status)
end

# add api to set status of characters

play_game

binding.pry