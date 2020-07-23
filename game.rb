require_relative 'global/intro'
require_relative 'global/player'


class Game
  include Intro
end

############### Game Structure ###############
game = Game.new

#Intro
game.game_intro

game.yes_no_choose_text
game.player_yes_no_choose_input('no_choose')

#Player creation
player = Player.new

player.roll_player_random_stat_dice
game.character_stats_intro(player)
game.main_player_stats_info

# Radis
