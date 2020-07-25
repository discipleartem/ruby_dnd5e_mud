require_relative 'global/intro'
require_relative 'global/player'


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
player.main_stats_display(player.main_stat)
player.player_choose_main_stats_info(player.main_stat)



# Redis
