require_relative '../global/dice'
require 'yaml'

class Global
  include Dice

  attr_accessor :main_stat

  TEXT_GLOBAL = YAML.load_file('global/data/global_text.yml')


  def initialize
    @main_stat = { STR: 0, DEX: 0, CON: 0, INT: 0, WIS: 0, CHAR: 0, LUCK: 0 }
  end


  def main_stats_display(main_stat)
    index = 1
    main_stat_info = TEXT_GLOBAL['main_stats_info_text']
    for stat in main_stat_info
      puts "[#{index}] #{stat[1]}: #{main_stat[main_stat.keys[index - 1]]}"
      index +=1
    end
    puts
  end

end
