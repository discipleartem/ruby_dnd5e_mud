require 'yaml'
require_relative '../global/intro'

class Races

  include Intro

  RACE_TEXT = YAML.load_file('global/data/races_text.yml')
  TEXT = YAML.load_file('global/data/global_text.yml')


  def races_text(player_choose)
    race = ['human', 'half_orc', 'elf']

    RACE_TEXT['races'][race[player_choose - 1]].each do |info|
      info_mod = info[1].to_s.split('"').to_s.delete('["').delete('{')
                   .delete('}').delete(",").delete(']').delete('=>')
                   .delete('intro').delete('sas_up').delete('languages')
                   .delete('hgh_elf_ably_1').delete('hgh_elf_ably_2').gsub("\n", ' ').squeeze(' ')
      text_output_info(info_mod, player_choose)
    end
  end


  def races_info(player)
    # races = {human: 'Человек', half_orc: 'Полуорк', elf: 'Эльф'}
    puts 'Вам дозволено выбрать расу:'
    puts '[1] ' + 'Человек  '.blue +
         '[2] ' + 'Полуорк  '.green +
         '[3] ' + 'Эльф  '.brown
    puts
    player_choose = gets.to_i
    puts
    if player_choose.between?(1,3)
      races_text(player_choose)

      puts 'Если согласны:'
      puts '[1] - Да,   [2] - Нет'
      player_confirm = gets.to_i

      if player_choose == 1 && player_confirm == 1
        human(player)

      elsif player_choose == 2 && player_confirm == 1
        half_orc(player)
      elsif player_choose == 3 && player_confirm == 1
        elf(player)
      else
        '### Вы сделали неправильный выбор ... ###'
        races_info(player)
      end

    else
      puts '### Вы сделали неправильный выбор расы ... ###'
      puts
      races_info(player)
    end
  end



  def set_races_language(player)
    #                   [0]              [1]
    languages = {orc: 'Орочий', elf: 'Эльфийский'}
   #display languages
   player.player_display_languages(player)

    puts 'Выберите дополнительный язык, которым желаете овладеть:'
    puts '[1] ' + "#{languages[:orc]}".green +
         '[2] ' + "#{languages[:elf]}".brown
    player_choose = gets.to_i

    if player_choose.between?(1, 2)

      unless player.languages.include?(languages.keys[player_choose - 1])
        player.languages = player.languages.push(languages.keys[player_choose - 1])
      else
        puts '### Вы уже владеете этим языком, выбирете другой ###'
        set_races_language(player)
      end

    else
      puts '### Вы ввели неправильное значения для языка ###'
      set_races_language(player)
    end
  end



  def human(player)
    player.main_stat = player.main_stat.each do |key, value|
      unless key.equal?(:LUCK)
        player.main_stat[key] = value + 1
      end
    end
    age(player, 20, 60)
    player.vision = {normal: {bright: 30, dim: 30}}
    1.times {set_races_language(player)}
    player.race = {human: 'Человек'}
  end



  def half_orc(player)
    age(player, 15, 60)
    player.languages.push(:orc)
    player.main_stat[:STR] = player.main_stat[:STR] + 2
    player.main_stat[:CON] = player.main_stat[:CON] + 1
    player.vision = {dark_vision: {bright: 60, dim: 30}}
    player.skill_proficiency << 'Запугивание'
    player.race_abilities << 'Непоколебимая стойкость' << 'Свирепые атаки'
    player.race = {half_orc: 'Полуорк'}
    player.abilities = {relentless_endurance: true}
  end


  def elf(player)
    age(player, 100, 700)
    player.languages.push(:elf)
    1.times {set_races_language(player)}
    player.main_stat[:DEX] = player.main_stat[:DEX] + 2
    player.main_stat[:INT] = player.main_stat[:INT] + 1
    player.vision = {dark_vision: {bright: 60, dim: 30}}
    player.skill_proficiency << 'Внимательность'
    player.race_abilities << 'Наследие фей' << 'Транс'
    player.weapon_proficiency << 'long_sword' << 'short_sword' << 'long_bow' << 'short_bow'
    player.magic = player.magic.merge({cantrip_race: {count: 1, main_stat: :INT}})
  end

  def age(player, age_1, age_2)
    puts "Введите свой возраст (от #{age_1} до #{age_2} лет) ..."
    player_choose = gets.to_i
    if player_choose.between?(age_1, age_2)
      player.age = player_choose
    else
      puts '### Вы ввели неправильный возраст, попробуйте еще раз ###'
      age(player, age_1, age_2)
    end
  end


end