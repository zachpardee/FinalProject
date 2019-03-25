class PlayerCharacter < ActiveRecord::Base
  belongs_to :player
  belongs_to :character
end
