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
    puts "#{@main_stats_name[:STR]}: #{@main_stats_info[:STR]}"
    puts "#{@main_stats_name[:DEX]}: #{@main_stats_info[:DEX]}"
    puts "#{@main_stats_name[:CON]}: #{@main_stats_info[:CON]}"
    puts "#{@main_stats_name[:INT]}: #{@main_stats_info[:INT]}"
    puts "#{@main_stats_name[:WIS]}: #{@main_stats_info[:WIS]}"
    puts "#{@main_stats_name[:CHAR]}: #{@main_stats_info[:CHAR]}"
    puts "#{@main_stats_name[:LUCK]}: #{@main_stats_info[:LUCK]}"
    puts
  end

  def create_character
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
      Human.new
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
        $player = Human.new
      elsif $u_choose == 2
        create_character
      else
        puts $text[:user_choose][:input_3]
        user_choose(gets.chomp.to_i)
        create_character
      end
    end
    end
end