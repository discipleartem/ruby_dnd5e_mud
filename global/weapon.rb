require_relative '../global/dice'



class Weapon
  include Dice

  #melee, range
  attr_accessor :type
  #one or two_handed
  attr_accessor :handed
  attr_accessor :damage
  attr_accessor :damage_type

  def initialize
    @damage = 1
    @handed = ['one', 'two', 'universal']
    @type = ['melee', 'range']
  end

end

class Sword < Weapon

  attr_accessor :names

  def initialize
    @names = ['long_sword']
  end

end

class LongSword < Sword

  def initialize
    @name = @names[0]
    @type = @type[0]
    @handed = @handed[2]
    @damage = [d8, d10]
    @damage_type = ['рубящий']
  end

end