require 'yaml'
require_relative '../global/dice'


module Intro
  include Dice

  TEXT = YAML.load_file('global/data/text.yml')
  TEXT_GLOBAL = YAML.load_file('global/data/global_text.yml')

  def game_intro
    TEXT['intro_text']['hello_text'].each {|text_key, value| puts value; sleep 2}
    puts
  end

  def yes_no_choose_text
    TEXT['user_choose']['output'].each { |key, value| puts value}
    puts
  end

  def player_yes_no_choose_input(no_chose=nil)
    input = gets.to_i
    if input == 1
      puts "Вы избрали ответ: #{TEXT['user_choose']['input']['input_1']}"
      puts
    elsif input == 2 && !no_chose
      puts "Вы избрали ответ: #{TEXT['user_choose']['input']['input_2']}"
      puts
      # get special param ('no_choose') in method (*args)
    elsif no_chose && input == 2
      puts "Вы избрали ответ: #{TEXT['user_choose']['input']['input_2']}, но Вы должны понимать, что выбора у Вас - НЕТ!"
      puts
    else
      puts "#{TEXT['user_choose']['input']['input_3']}"
      player_yes_no_choose_input(no_chose)
    end
  end

  def main_player_stats_info
      index = 1
      main_stat_info = TEXT_GLOBAL['main_stats_info']
      main_stat_info_text = TEXT_GLOBAL['main_stats_info_text']
      for main_stat in main_stat_info
        puts "[#{index}] #{main_stat_info_text[main_stat[0]]}: #{main_stat_info[main_stat[0]]}"
        index +=1
      end
      puts
    end

  def character_stats_intro(player)
    puts 'Боги одарили Вас такими значениями Характеристик: '
    puts  "#{player.random_player_stats}"
    puts
    puts "Вы можете самостоятельно распределить эти значения по ключевым Характеристикам: "
    puts 'Кроме параметра Удачи,- он даруеться богами'
    puts
  end




end
