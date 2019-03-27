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
  puts "Please enter your name: "
  response = gets.chomp
  player = Player.find_by(name:response)
  puts "Enter your character selection: "
  character = gets.chomp()
  puts "alive or dead?"
  dead_or_alive = gets.chomp
  PlayerCharacter.create(
    player: player,
    character: Character.find_by(name:character),
    predictedstatus: dead_or_alive)

end

play_game

binding.pry
