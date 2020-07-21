require_relative 'global/intro'
require_relative 'global/global'


class Game
  include Intro
  include Global
end

############### Game Structure ###############
game = Game.new

#Intro
game.intro
game.player_yes_no_choose_text
game.player_yes_no_choose_input('no_choose')
# game.player_yes_no_choose_input