require_relative '../global/dice'

class World
  include Dice

  def initialize
    @main_stats_name = {STR: 'Сила', DEX: 'Ловкость', CON: 'Телосложение', INT: 'Интелект', WIS: 'Мудрость', CHAR: 'Харизма', LUCK: 'Удача'}
    @main_stats_info = {
                        STR: 'измеряет физическую мощь',
                        DEX: 'измеряет проворство',
                        CON: 'измеряет выносливость',
                        INT: 'измеряет рассудительность и память',
                        WIS: 'измеряет внимательность и проницательность',
                        CHAR: 'измеряет измеряющая силу характера',
                        LUCK: 'скрытый параметр, который может влиять на различные ситуации.'
    }

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

  def confirm_choose
    puts 'Подтвердить: 1'
    puts 'Вернуться: 2'
  end
end