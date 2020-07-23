require_relative '../global/global'


class Player < Global
  attr_accessor :random_player_stats
  attr_reader :main_stat


  def initialize
    @random_player_stats = []
    @main_stat = []
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
    sleep 2
    dice.delete_at(dice.index(dice.min))
    dice_result = dice[0] + dice[1] + dice[2]
    random_player_stats.push(dice_result)
    @random_player_stats = @random_player_stats.sort.reverse
    puts
  end
end


end