require_relative '../global/global'

class Classes < Global

  def class_fighter(player)
    @hit_dice = d10
    @level = 1
    @hp_max = 10
    player.armor_proficiency << 'all_armor' << 'all_shield'
    player.weapon_proficiency << 'simply_weapon' << 'warrior_weapon'
    player.saving_throws = [:STR, :CON]

    # Навыки: Выберите два навыка
    def fighter_skill(player)
      skill = ['Акробатика', 'Атлетика', 'Внимательность', 'Выживание', 'Запугивание', 'История', 'Проницательность', 'Уход за животными']
      index = 1
      skill.each do |s|
        puts "Выберите навык, которым желаете овладеть:"
        p "[#{index}]  #{s}"
        index += 1
      end
      user_input = gets.to_i
      if user_input.between?(1, skill.count)
        puts "Вы выбрали #{skill[user_input - 1]}"
        puts 'Подтвердите Ваш выбор:'
        puts '[1] - Да,   [2] - Нет'
        player_confirm = gets.to_i
        if player_confirm == 1
          player.skill_proficiency << skill[user_input - 1]
          skill.delete_at(user_input - 1)
        else
          puts "### Вы сделали неправильный выбор ###"
          fighter_skill(player)
        end
      else
        puts "### Вы выбрали неправильный навык ###"
        fighter_skill(player)
      end
    end
    2.times fighter_skill(player)
    #eqip
  end




end