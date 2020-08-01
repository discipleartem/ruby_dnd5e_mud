require_relative '../global/dice'
require_relative '../global/weapon'
require 'yaml'

class Global
  include Dice

  attr_accessor :main_stat
  attr_accessor :size
  attr_accessor :speed
  attr_accessor :languages
  attr_accessor :vision
  attr_accessor :race
  attr_accessor :hp_max
  attr_accessor :hp_current
  attr_accessor :damage
  attr_accessor :skills
  attr_accessor :abilities
  attr_accessor :race_abilities
  attr_accessor :weapon_proficiency
  attr_accessor :skill_proficiency
  attr_accessor :magic

  TEXT_GLOBAL = YAML.load_file('global/data/global_text.yml')

  def initialize
    @main_stat = { STR: 10, DEX: 10, CON: 10, INT: 10, WIS: 10, CHAR: 10, LUCK: 0 }
    @size = 'medium'
    @speed = 30
    @skill_proficiency = []
    @weapon_proficiency = []
    @race_abilities = []
    @languages = [:common]
    @hp_max = 1
    @hp = 1
    @magic = {}
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
      p 'Вы владеете следующими рассовыми способностями:'
      player.race_abilities.each { |ra| puts ra }
      puts

      p 'Вы владеете следующими навыками:'
      player.skill_proficiency.each { |sp| puts sp }
      puts

      p 'Вы владеете следующим оружием:'
      player.weapon_proficiency.each { |wp| puts wp }
      puts

      p 'Вы владеете следующими магическими навыками:'
      player.magic.each do |skill|
        puts "#{TEXT_GLOBAL['magic']['cantrip_race']}:"
        puts "- #{TEXT_GLOBAL['magic']['count']}: #{skill[1][:count]}."
        puts "- #{TEXT_GLOBAL['magic']['main_stat']}: #{skill[1][:main_stat]}"
      end
      puts
    end
    puts
  end

end
