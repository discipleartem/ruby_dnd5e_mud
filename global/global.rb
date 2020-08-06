require_relative '../global/dice'
require_relative '../global/weapon'
require_relative '../global/intro'
require 'yaml'

class Global
  include Dice
  include Intro

  attr_accessor :main_stat
  attr_accessor :main_stat_modify
  attr_accessor :size
  attr_accessor :speed
  attr_accessor :languages
  attr_accessor :vision
  attr_accessor :race
  attr_accessor :hit_dice
  attr_accessor :hp_max
  attr_accessor :hp_current
  attr_accessor :damage
  attr_accessor :skills
  attr_accessor :abilities
  attr_accessor :race_abilities
  attr_accessor :weapon_proficiency
  attr_accessor :armor_proficiency
  attr_accessor :skill_proficiency
  attr_accessor :magic
  attr_accessor :level
  attr_accessor :saving_throws

  TEXT_GLOBAL = YAML.load_file('global/data/global_text.yml')

  def initialize
    @main_stat = { STR: 20, DEX: 18, CON: 16, INT: 14, WIS: 12, CHAR: 8}
    @main_stat_modify = { STR: 0, DEX: 0, CON: 0, INT: 0, WIS: 0, CHAR: 0}
    @size = 'medium'
    @speed = 30
    @skill_proficiency = []
    @race_abilities = []
    @languages = [:common]
    @hp_max = 1
    @hp = 1
    @magic = {}
  end


  def main_stats_display(player)
    puts 'Ваши Характеристики:'
    main_stat_info = TEXT_GLOBAL['main_stats_info_text']
    index = 1

    main_stat.each do |key, value|
      unless key == :LUCK

        if detect_main_stat_modify(player, key, value) < 0
          puts "[#{index}] " + "#{main_stat_info[key.to_s.downcase]}: ".color_stat_text[:main_stat][index - 1]  +"#{value}  " + "|Модификатор|: " + "#{player.main_stat_modify[key]}".red
        elsif detect_main_stat_modify(player, key, value) >= 4
          puts "[#{index}] " + "#{main_stat_info[key.to_s.downcase]}: ".color_stat_text[:main_stat][index - 1]  +"#{value}  " + "|Модификатор|: " + "#{player.main_stat_modify[key]}".green
        elsif detect_main_stat_modify(player, key, value).between?(2, 3)
          puts "[#{index}] " + "#{main_stat_info[key.to_s.downcase]}: ".color_stat_text[:main_stat][index - 1]  +"#{value}  " + "|Модификатор|: " + "#{player.main_stat_modify[key]}".brown
        else
          puts "[#{index}] " + "#{main_stat_info[key.to_s.downcase]}: ".color_stat_text[:main_stat][index - 1]  +"#{value}  " + "|Модификатор|: " + "#{player.main_stat_modify[key]}"
        end
        index += 1
      end

    end
    puts
    player_display_languages(player)
    unless player.age.nil?
      if player.age >= 100
        print 'Ваш возраст: ' + "#{player.age}".brown
        puts
      else
        puts "Ваш возраст: #{player.age}"
      end
      puts "Ваш размер: #{TEXT_GLOBAL['size'][player.size]}"
      puts "Ваша скорость: #{player.speed}"
      puts

      puts 'Вы владеете следующими рассовыми способностями:'
      player.race_abilities.each { |ra| puts ra.magenta }
      puts

      puts 'Вы владеете следующими навыками:'
      player.skill_proficiency.each { |sp| puts sp.cyan }
      puts

      puts 'Вы владеете следующим оружием:'
      player.weapon_proficiency.each { |wp| puts wp.brown }
      puts

      puts 'Вы владеете следующими магическими навыками:'
      player.magic.each do |skill|
        puts "#{TEXT_GLOBAL['magic']['cantrip_race']}:"
        puts "- #{TEXT_GLOBAL['magic']['count']}: #{skill[1][:count]}"
        puts "- #{TEXT_GLOBAL['magic']['main_stat']}: " + "#{skill[1][:main_stat]}".blue
      end
      puts
    end
    puts
  end


  def detect_main_stat_modify(player, key, value)
    # main_stat = @main_stat

    if key == :LUCK
      puts '### Параметр Удачи не имеет Мофификатора ###'
    elsif value == 1
      player.main_stat_modify[key] = -5

    elsif value.between?(2, 3)
      player.main_stat_modify[key] = -4

    elsif value.between?(4, 5)
      player.main_stat_modify[key] = -3

    elsif value.between?(6, 7)
      player.main_stat_modify[key] = -2

    elsif value.between?(8, 9)
      player.main_stat_modify[key] = -1

    elsif value.between?(10, 11)
      player.main_stat_modify[key] = +0

    elsif value.between?(12, 13)
      player.main_stat_modify[key] = +1

    elsif value.between?(14, 15)
      player.main_stat_modify[key] = +2

    elsif value.between?(16, 17)
      player.main_stat_modify[key] = +3

    elsif value.between?(18, 19)
      player.main_stat_modify[key] = +4

    elsif value.between?(20, 21)
      player.main_stat_modify[key] = +5
    end
      player.main_stat_modify[key]
  end









end



