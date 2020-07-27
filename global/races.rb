require 'yaml'

class Races

  RACE_TEXT = YAML.load_file('global/data/races_text.yml')

  def races_info(player)
    puts 'Вам дозволено выбрать расу:'
    puts '[1] Человек     [2]Орк       [3]Эльф '
    puts
    player_choose = gets.to_i
    puts
    if player_choose == 1
      RACE_TEXT['races']['human'].each do |info|
        if  info[1].size <= 150
          puts info[1]
          puts
        else
          puts info[1].split(". ")
          puts
        end
      end
    else
      '### Вы сделали неправильный выбор расы ... ###'
      races_info(player)
    end
    puts 'Подтвердите свой выбор:'
    puts '[1] - Да     [2] - Нет'
    player_choose = gets.to_i
    if player_choose == 1
      human(player)
    else
      puts 'Сделайте ваш выбор:'
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
    player.size = 'medium'
    player.speed = 30

    def human_age(player)
      puts 'Введите свой возраст (от 20 до 60 лет) ...'
      player_choose = gets.to_i
      if player_choose.between?(20, 60)
        player.age = player_choose
      else
        puts '### Вы ввели неправильный возраст, попробуйте еще раз ###'
        human_age(player)
      end
    end

    human_age(player)
    player.languages = [:common]
    1.times {set_races_language(player)}
  end

  def orc
  end

  def elf
  end

end