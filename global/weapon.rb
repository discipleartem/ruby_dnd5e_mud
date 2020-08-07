require_relative '../global/dice'



class Weapon
  include Dice

  #melee, range
  attr_accessor :range
  #one or two_handed
  attr_accessor :handed

  attr_accessor :damage
  attr_accessor :damage_type
  attr_accessor :price
  attr_accessor :weight
  attr_accessor :name
  attr_accessor :type
  attr_accessor :disadvantage


  def initialize
    @damage = 1
    @handed = ['one', 'two', 'universal']
    @range = ['melee', 'range']
    @type = ['warrior_melee', 'simple_melee', 'warrior_range', 'simple_range', 'improvise']
  end



  class Sword < Weapon
  attr_reader :type
  attr_reader :name
  attr_reader :range
  attr_accessor :damage_type


  def initialize
    @name = ['long_sword']
    @range = @range[0]
    @damage_type = ['рубящий', 'колющий']
  end

  class LongSword < Sword
    def initialize
      @name = @name[0]
      @price = {gold: 15}
      @weight = 3
      @handed = @handed[2]
      @damage = [d8, d10]
      @damage_type = @damage_type[0]
      @type = @type[0]
    end
  end

end

  class Bow <Weapon

  def initialize
    @need_ammo = true
  end

  class LongBow < Bow
    def initialize(player)
      @name = 'long_bow'
      @type = @type[2]
      @price = {gold: 50}
      @weight = 2
      @range = @range[1]
      @handed = @handed[1]
      @damage = [d8]
      @damage_type = ['колющий']
      @disadvantage = player.size == 'small' ? true : false
      @bow_distance = {min: 150, max: 600}
    end
  end

end







end