require_relative '../global/world'
require_relative '../global/dice'
require_relative '../races/races'
require_relative '../races/human'

class Player < Races
  include Dice

  @@character_stats = []
  @roll_dice = []

  def roll_stat_dice
    character_stats = []
    4.times {character_stats.push(d6)}
    puts "Кубик выпал так #{character_stats}"
    character_stats.delete_at(character_stats.index(character_stats.min))
    puts "Итоговый результат костей: #{character_stats} "
    @roll_dice = character_stats[0] + character_stats[1] + character_stats[2]
    @@character_stats.push(@roll_dice)
    puts
    puts
  end

  def create_character_stats
    # бросить 4d6 где выбрать 3 с найбольшим значением х 6 раз
    6.times {roll_stat_dice}
    puts 'Боги одарили Вас такими значениями Характеристик: '
    puts
    @@character_stats = @@character_stats.sort.reverse
    puts "#{@@character_stats}"
    puts "Вы можете самостоятельно распределить эти значения по ключевым Характеристикам: "
    puts 'Кроме параметра Удачи,- он даруеться богами'
    puts

    #display main player stats
    main_player_stats_info
    while @@character_stats.any?
      #change main player stats
      puts 'Введите номер характеристики, которую хотите изменить: ...'
      puts "[0] Сила; [1] Ловкость; [2] Телосложение; [3] Интелект; [4] Мудрость; [5] Харизма;"

      user_choose(gets.chomp.to_i)
      player_choose_main_stats
      player_confirm_main_stats

    end
    # puts "[0] Сила; [1] Ловкость; [2] Телосложение; [3] Интелект; [4] Мудрость; [5] Харизма;"
    display_player_main_stats
  end


  def create_character_race
    puts 'Вам дозволено выбрать в кого вселиться ....'
    puts
    puts 'Выберите расу: '
    puts "Нажимте '1', если хотите стать #{@@races_name[:human]}."
    puts "Нажимте '2', если хотите стать #{@@races_name[:elf]}."
    puts "Нажимте '2', если хотите стать #{@@races_name[:orc]}."

    user_choose(gets.chomp.to_i)
    if $u_choose == 1
      puts "Вы выбрали расу #{@@races_name[:human]} ."
      puts "Особенности расы: "
      # $player << $player = Human.new
      puts "#{$race_info[:intro]}"
      puts
      puts "#{$race_info[:stats_up]}"
      puts
      puts "#{$race_info[:age]}"
      puts
      puts "#{$race_info[:size]}"
      puts
      puts "#{$race_info[:speed]}"
      puts
      puts "#{$race_info[:languages]}"
      puts
      puts "Чтобы подтвердить свой выбор, нажмите '1', чтобы вернуться к выбору рас,- нажмите '2' ..."
      user_choose(gets.chomp.to_i)
      if $u_choose == 1
        # $player = Human.new
        $player.human_main_stats_specify
      elsif $u_choose == 2
        create_character_race
      else
        puts $text[:user_choose][:input_3]
        user_choose(gets.chomp.to_i)
        create_character_race
      end
    end
  end

  def main_player_stats_info
    index = 0
    for name in @main_stats_name
      puts "[#{index}] #{name[1]}: #{@main_stats_info[name[0]]}"
      index +=1
    end
    puts
  end

  def player_choose_main_stats
    if $u_choose.between?(0, 5)
      #в зависимости от выбора вытащить из массива @main_stats_name ту пару ключ -> значение, что ввел игрок
      @key = @main_stats_name.keys[$u_choose]
      puts "Вы выбрали параметр #{@main_stats_name[@key]}"
      confirm_choose
      user_choose(gets.chomp.to_i)
      player_confirm_main_stats
      #Return to next Main Stat

    elsif $u_choose == 6
      puts "Вы выбрали параметр #{@main_stats_name[:LUCK]}"
      puts "Только боги решают какой #{@main_stats_name[:LUCK]} вас одарить"
      puts
    else
      puts $text[:user_choose][:input_3]
      user_choose(gets.chomp.to_i)
      player_choose_main_stats
    end
  end

  def player_confirm_main_stats
      puts "Доступные значения #{@@character_stats}"
      puts 'Введите доступное Вам значение для этой Характеристики:'
      #Input available Value for Choosen Main stat
      user_choose(gets.chomp.to_i)
      correct_player_main_stat_choose
      display_player_main_stats

      player_confirm_main_stats
      user_choose(gets.chomp.to_i)
      player_choose_main_stats
  end

  def display_player_main_stats
    puts
    puts 'Игрок обладает такими статами:'
    for stat in $main_stats
      puts "#{@main_stats_name[stat[0]]}:  #{stat[1]}"
    end
  end

  def correct_player_main_stat_choose
    if @@character_stats.find {|stat| stat == $u_choose}
      $main_stats[@key] = @@character_stats.find {|stat| stat == $u_choose}
      @@character_stats.delete_at(@@character_stats.index(@@character_stats.find {|stat| stat == $u_choose}))
      #Aply selected stat (from Array) to Main stat
      $main_stats[@key] = $u_choose
      #Again display Main stats. Make def for this
      puts "#{@main_stats_name[@key]}: #{$main_stats[@key]}"
      puts "Оставшиеся значения: "
      puts "#{@@character_stats}"
    else
      puts 'Вы ввели неверное значения'
      user_choose(gets.chomp.to_i)
      correct_player_main_stat_choose
    end
  end

end