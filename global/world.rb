class World
  include Dice

  def initialize
    @main_stats_name = {STR: 'Сила', DEX: 'Ловкость', CON: 'Телосложение', INT: 'Интелект', WIS: 'Мудрость', CHAR: 'Харизма', LUCK: 'Удача'}
    $main_stats = {STR: 0,
                   DEX: 0,
                   CON: 0,
                   INT: 0,
                   WIS: 0,
                   CHAR: 0,
                   LUCK: 0
    }
    @size_info = {medium: 'Средний', small: 'Маленький', big: 'Большой', large: 'Огромный'}
    @size = @size_info[:medium]
  end

  def user_choose(input)
    $u_choose = input
  end


end