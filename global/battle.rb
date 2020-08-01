require 'yaml'
require_relative '../global/intro'
require_relative '../global/weapon'

module Battle

  include Intro
  include Weapon

  RACE_TEXT = YAML.load_file('global/data/races_text.yml')

  def battle_player_die(player)
    if player.hp_current <= 0 && player.hp_current.abs >= player.hp_max
      puts 'Вы получили смертельный урон.'
      puts "урон: #{player.damage}, опустил здоровье #{player.hp_current}, что > или = #{player.hp_max}"
    elsif player.race.keys == [:half_orc] && player.hp_current <= 0 && player.abilities[:relentless_endurance] == true
      player.abilities[:relentless_endurance] = false
      puts "Сработала Ваша способность: #{text_output_info(RACE_TEXT['races']['half_orc']['half_orc_ability_3'])}"
    elsif player.hp_current <= 0
      puts 'Вы без сознания ... и боретесь за свою жизнь ...'
    end
  end

  def battle_player_crit(dice)
    if dice == 20 && player.race.keys == [:half_orc] && player.weapon.type == 'melee'
      player.weapon.damage * 2 + player.weapon.damage
      puts "Вы нанесли критический урон #{player.weapon.damage} x 2 + #{player.weapon.damage} от способности #{text_output_info(RACE_TEXT['races']['half_orc']['half_orc_ability_4'])}"
    else
      player.weapon.damage * 2
    end
  end




end