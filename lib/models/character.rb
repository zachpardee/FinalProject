class Character < ActiveRecord::Base
  has_many :player_characters
  has_many :players, through: :player_characters
end
