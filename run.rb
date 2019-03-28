require_relative "./config/environment"

def play_game

  puts "\nMenu: \n
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
  when "new draft"
     PlayerCharacter.destroy_all #Clear all prior draft picks
    # Set number draft picks
    number_of_draft_picks = 1
    number_of_draft_picks.times do
      draft_a_character
    end
  when "admin"
    verify_admin
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

def admin_controls
      puts "\nAdmin Controls:
      Create a player
      Create a character
      Delete a player
      Delete a Character
      Kill a Character
      Revive a Character
      Delete a draftpick
      Exit
      "
      user_input = gets.chomp
      case user_input.downcase
      when "create a player"
        admin_create_player
      when "create a character"
        admin_create_character
      when "delete a player"
        admin_delete_player
      when "delete a character"
        admin_delete_character
      when "kill a character"
        admin_kill_character
      when "revive a character"
        admin_revive_character
      when "delete a draftpick"
        delete_draft_pick
      when "exit"
        return
      end
end


def draft_a_character
  list_all_players
  response = ''
  while (Player.all.map {|player| player.name}.exclude? response) do
    puts "\nPlease enter your name: "
    #if response = admin, enter admin console to kill characters, add players, etc.
    response = gets.chomp
  end

  loop do

    player = Player.find_by(name:response)
    Character.all.each do |character|
      puts character.name
    end

    character = ''
    while (Character.all.map {|char|char.name}.exclude? character) do
      puts "\nEnter your character selection: "
      character = gets.chomp()
    end

    dead_or_alive = ''
    while (dead_or_alive != "alive" && dead_or_alive != "dead") do
      puts "alive or dead?"
      dead_or_alive = gets.chomp
    end

    keep_loop = true
    player_array = PlayerCharacter.all.select {|playercharacter| playercharacter.player.name == response}
    if(player_array.length > 0 )
      status_array = player_array.select {|playerchar| playerchar.predictedstatus == dead_or_alive}
      if(status_array.length >= 3 )
        puts "You have already drafted 3 players to be : #{dead_or_alive}"
        puts "\n\n Please try again...\n\n"

        puts "Please enter your name: "
        #if response = admin, enter admin console to kill characters, add players, etc.
        response = gets.chomp
        keep_loop = false
      end
    end

    if(player_array.length < 7)
      PlayerCharacter.create(
        player: player,
        character: Character.find_by(name:character),
        predictedstatus: dead_or_alive)
    end

  break if keep_loop

  end


end



def list_all_players
  Player.all.each do |player|
    puts player.name
  end
end

def list_all_characters
  Character.all.each do |character|
    puts character.name.ljust(20) + "Status: " + character.status
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

def delete_draft_pick
  puts "Please enter the name of the player you wish to delete a draft pick from"
  user_player = gets.chomp
  Player.all.select do |player|
    if (player.name == user_player)
      player.view_characters_drafted
    end
  end

  puts "Select the character to delete please:"
  user_character = gets.chomp

  puts "Please enter alive or dead for the characters status:"
  user_status = gets.chomp
  PlayerCharacter.all.map do |playercharacter|
    if(playercharacter.player.name == user_player &&
      playercharacter.character.name == user_character &&
      playercharacter.predictedstatus == user_status)
      #Remove the draftpick from the database
      playercharacter.destroy
    end
  end
end

def get_user_player_characters
  puts "Please enter the name of the player you wish to delete a draft pick from"
  user_input = gets.chomp
  Player.all.select do |player|
    if (player.name == user_input)
      player.view_characters_drafted
    end
  end
end

def verify_admin
  puts "Please enter password:"
  user_input = gets.chomp
  if(user_input == "Scooby")
    admin_controls
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

def admin_revive_character
  puts "Please enter the character you wish to revive."
  dead_character = gets.chomp
  Character.revive_character(dead_character)
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
