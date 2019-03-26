require "sinatra/activerecord"
require "pry"

require "require_all"
require_all "lib"

ActiveRecord::Base.establish_connection(
adapter: "sqlite3",
database: "db/fantasy.db"
)



# draft_player(zach, sansa, "dead")
# draft_player(zach, sansa, "alive")
#
# def calculate_total_score(player)
#
# end
#
#
# def kill_character(character)
#
# end

binding.pry
