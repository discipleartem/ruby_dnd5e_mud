require_relative '../global/dice'
require 'yaml'

class Global
  include Dice

  attr_accessor :main_stat
  attr_accessor :size
  attr_accessor :speed
  attr_accessor :languages

  TEXT_GLOBAL = YAML.load_file('global/data/global_text.yml')


  def initialize
    @main_stat = { STR: 10, DEX: 10, CON: 10, INT: 10, WIS: 10, CHAR: 10, LUCK: 0 }
    @size = 'medium'
    @speed = 30
    @languages = [:common]
  end


  def main_stats_display(player)
    puts 'Ваши Характеристики:'
    index = 1
    main_stat_info = TEXT_GLOBAL['main_stats_info_text']
    for stat in main_stat_info
      unless stat[0] == "luck"
        puts "[#{index}] #{stat[1]}: #{main_stat[main_stat.keys[index - 1]]}"
        index +=1
      end
    end
    puts
    player_display_languages(player)
    unless player.age.nil?
      p "Ваш возраст: #{player.age}"
      p "Ваш размер: #{TEXT_GLOBAL['size'][player.size]}"
      p "Ваша скорость: #{player.speed}"
    end
    puts
  end

end
