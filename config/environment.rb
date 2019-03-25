require "sinatra/activerecord"
require "pry"

require "require_all"
require_all "lib"

ActiveRecord::Base.establish_connection(
adapter: "sqlite3",
database: "db/fantasy.db"
)

dany = Character.create(name:"Dany", status: "alive")
john = Character.create(name:"John Snow", status: "alive")
yara = Character.create(name:"Yara Greyjoy", status: "alive")
theon =Character.create(name:"Theon Greyjoy", status: "alive")
mountain = Character.create(name:"The Mountain", status: "alive")

zach = Player.create(name:"Zach", score: 3)
kendall = Player.create(name:"Kendall", score: 3)
zack = Player.create(name:"Zack", score: 3)
jack = Player.create(name:"Jack", score: 3)
kevin = Player.create(name:"Kevin", score: 3)
jard = Player.create(name:"Jared", score: 3)
sarah = Player.create(name:"Sarah", score: 3)


def draft_player(player, character)
  PlayerCharacter.create(player: player, character: character)
end

binding.pry
