require "sinatra/activerecord"
require "pry"

require "require_all"
require_all "lib"

ActiveRecord::Base.establish_connection(
adapter: "sqlite3",
database: "db/fantasy.db"
)


def play_game

  PlayerCharacter.destroy_all

  # First Draft Pick

  1.times do
    Player.all.each do |player|
      puts player.name
    end
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

  # display player scores

  def display_scores
  end
  # kill a character and recalculate player scores

  def kill_character
    puts "Please enter the character you wish to die."
    dead_character = gets.chomp()
    Character.find_by(name: dead_character).status = "dead"
    
  end

  def all_players_score
    Player.all.map(&:calc_score)
  end
  # display new player scores
  # add a administrator command


  # add api to set status of characters

end

play_game
display_scores

binding.pry
