require_relative '../global/world'
require_relative '../races/races'
require_relative '../races/human'

class Player < Races

  def create_character_stats
    # бросить 4d6 где выбрать 3 с найбольшим значением
    character_stats = []
    4.times {character_stats.push(d6)}
      # if character_stats.count >= 4
        #делает то же самое что и .uniq метод УДАЛЯЯ результат
        # remove_excess = character_stats.find {|excess| excess == character_stats.min}
        # character_stats.delete(remove_excess) # [4, 5]

      end
    arr.delete(2)
    puts 'Боги одарили Вас такими значениями Характеристик: '
    puts "#{character_stats}  вы можете самостоятельно распределить эти значения по ключевым Характеристикам"

  end


  def create_character
    puts 'Вам дозволено выбрать в кого вселиться ....'
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