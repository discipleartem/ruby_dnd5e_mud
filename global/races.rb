require 'yaml'

class Races

  RACE_TEXT = YAML.load_file('global/data/races_text.yml')


  def races_text(player_choose)
    race = ['human', 'half_orc', 'elf']
    RACE_TEXT['races'][race[player_choose - 1]].each do |info|
      if  info[1].size <= 150
        puts info[1]
        puts
      else
        puts info[1].split(". ")
        puts
      end
    end
  end



  def races_info(player)
    # races = {human: 'Человек', half_orc: 'Полуорк', elf: 'Эльф'}
    puts 'Вам дозволено выбрать расу:'
    puts '[1] Человек     [2] Полуорк       [3] Эльф '
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
    #               [0]                [1]              [2]
    languages = {common: 'Общий', orc: 'Орочий', elf: 'Эльфийский'}
   #display languages
   player.player_display_languages(player)

    puts 'Выберите дополнительный язык, которым желаете овладеть:'
    puts "[1] #{languages[:common]}  [2] #{languages[:orc]} [3] #{languages[:elf]}"
    player_choose = gets.to_i

    if player_choose.between?(1, 3)

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
    1.times {set_races_language(player)}
  end



  def half_orc(player)
    age(player, 15, 60)
    player.languages.push(:orc)
  end

  def elf
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