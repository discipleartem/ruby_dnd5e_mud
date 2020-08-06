require_relative 'global/intro'
require_relative 'global/player'
require_relative 'global/races'
require_relative 'global/classes'


include Intro

############### Game Structure ###############

#Intro
# game_intro
# yes_no_choose_text
# player_yes_no_choose_input('no_choose')


#Player creation
player = Player.new

player.roll_player_random_stat_dice
character_stats_intro(player)
main_stats_info_text
player.main_stats_display(player)
player.player_choose_main_stats_info(player)
player.main_stats_display(player)

#Choosing race
race = Races.new
race.races_info(player)

# add to main_stats_display
player.player_mastery(level)

player.main_stats_display(player)

#Choosing class
player_class = Classes.new
