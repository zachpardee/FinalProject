Filename: README.txt
Authors: Kendall Willard, Zach Pardee
Date Created: March 25, 2019
Filename Description: This file contains the readme for the Game of Thrones
                      Fantasy League


******** USER STORIES **********

1. As a user, I want to be able to draft a character

2. As a user, I want to be able to be able to view my current score.

3. As a user, I want to be able to see the characters I drafted.

4. As a user, I want to be able to see who drafted a specific character.

************ Game Description ***********
This is a Game of Thrones Fantasy League. The league consists of 8 Players, with
each player selecting 3 GoT characters to survive throughout the final season, and
3 characters to die by the end of the season. The player with the most correct
predictions at the end of the season is the winner.

************ How to play this game ***********

1. Add participating players to the seed.rb file. Each player needs to be instantiated
  with a name. You can also add characters to the seed file, but the main characters
  are already added.

2. run rake db:seeds in console to add characters and players to active database

3. run run.rb in console to start the application

4. type 'New Draft' and press enter. Follow directions to draft characters for
selected players

5. After drafting, type "view current player scores" to view current score of each player

6. If a character dies in Game of Thrones, enter Admin controls by typing 'Admin',
  and then type 'kill a character'. Follow the directions to set a character status
  to 'dead'.

7. run 'view current player scores' to see the scores after updating a character status
