require_relative '../global/global'

class Classes < Global

  def class_warrior(player)
    @hit_dice = d10
    @level = 1
    @hp_max = 10
  end

end