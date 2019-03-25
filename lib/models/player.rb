class Player < ActiveRecord::Base
  has_many :player_characters
  has_many :characters, through: :player_characters
end
