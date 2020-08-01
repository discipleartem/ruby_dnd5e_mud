require_relative '../global/global'
require_relative '../global/intro'
require_relative '../global/weapon'

include Intro

class Player < Global

  attr_accessor :random_player_stats
  attr_accessor :main_stat
  attr_accessor :tmp_player_key_protect
  attr_accessor :age



  def initialize
    @random_player_stats = []
    @tmp_player_key_protect = []

    super
    @main_stat = { STR: 0, DEX: 0, CON: 0, INT: 0, WIS: 0, CHAR: 0, LUCK: 0 }
  end


  def roll_player_random_stat_dice
    puts 'В этом мире боги играют в кости ...'
    sleep 2
    puts
    6.times do |i|
      dice = []
      4.times {dice.push(d6)}
      puts 'Бросаем 4-ре 6-ти гранных кубика:'
      puts "Бросок #{i + 1} выпал так: "
      puts "#{dice}"
      puts 'Складываем 3 наибольших числа'
      # sleep 2
      dice.delete_at(dice.index(dice.min))
      dice_result = dice[0] + dice[1] + dice[2]
      random_player_stats.push(dice_result)
      @random_player_stats = random_player_stats.sort.reverse
      puts
    end
  end



  def player_choose_main_stats_info(player)
    # choose_stat = choose_stat
    while random_player_stats.any?

      puts 'Введите номер характеристики, которую хотите изменить: ...'
      puts "[1] Сила [2] Ловкость [3] Телосложение [4] Интелект [5] Мудрость [6] Харизма"
      puts
      player_choose = gets.to_i
      puts

      if player_choose.between?(1, 6)
        player_choose_main_stats(player_choose, player)

      elsif player_choose == 7
        puts "Вы выбрали параметр #{TEXT_GLOBAL['main_stats_info_text']['luck']}"
        puts 'Только боги решают какой Удачей Вас одарить'
        puts

      else
        puts '### Вы ввели неверное значение для Характеристики ###'
        puts
        player_choose_main_stats_info(player)
      end
    end
    main_stat[:LUCK] = d20
  end



  def player_choose_main_stats(player_choose, player)
    # player_choose = player_choose

    if player_choose.between?(1, 6)

      key = main_stat.keys[player_choose - 1]
      text_key =  key.downcase

      #protect from multiply choices one main stat
      unless tmp_player_key_protect.include?(key)
        puts "Вы выбрали параметр #{TEXT_GLOBAL['main_stats_info_text']["#{text_key}"]}"
        yes_no_choose_text
        user_choice = gets.to_i
        if user_choice == 1
          p random_player_stats
          puts 'Введите значение для характеристики, которую Вы хотите улучшить: '
          puts
          player_change_main_stat(key, player)
        else
          puts
          puts 'Возврат к выбору Характеристик:'
          main_stats_display(player)
          player_choose_main_stats_info(player)
        end

      else
        puts "### Вы уже выбирали Характеристику #{TEXT_GLOBAL['main_stats_info_text']["#{text_key}"]}, выберите другую ###"
        player_choose_main_stats(player_choose = gets.to_i)
      end

    else
      puts '### Вы ввели неверную Характеристику, которую хотите изменить ###'
      player_choose_main_stats(player_choose = gets.to_i)
    end
  end


  def player_change_main_stat(key, player)
    key = key
    user_choice = gets.to_i
    player_stat = random_player_stats.find {|stat| stat == user_choice}

    if player_stat == user_choice
      main_stat[key] = player_stat
      tmp_player_key_protect.push(key)

      p player_stat

      #remove current player choice value from array random_player_stats
      random_player_stats.delete_at(random_player_stats.index(player_stat))

      #aply selected stat (from random_player_stats) to main_stat
      main_stat[key] = user_choice

      main_stats_display(player)
      puts "Оставшиеся значения: "
      p random_player_stats
      puts
    else
      puts '### Вы ввели неверное значение ###'
      p random_player_stats
      player_change_main_stat(key, player)
    end
  end

  def player_display_languages(player)
    text = TEXT_GLOBAL['languages']
    puts 'Вы владеете следующими языками:'
    if languages
      languages.each do |key|
        p text[key.to_s]
      end
    else
      puts 'Вы пока не владеете никакими языками'
    end
    puts
  end

end