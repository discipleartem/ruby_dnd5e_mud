require_relative '../global/dice'



class Weapon
  include Dice

  #melee, range
  attr_accessor :type
  #one or two_handed
  attr_accessor :handed

  attr_accessor :damage
  attr_accessor :damage_type
  attr_accessor :price
  attr_accessor :weight
  attr_accessor :name
  attr_accessor :disadvantage


  def initialize
    @damage = 1
    @handed = ['one', 'two', 'universal']
    @type = ['melee', 'range']
  end



  class Sword  < Weapon


    class LongSword < Sword
      def initialize
        @name = 'long_sword'
        @price = {gold: 15}
        @weight = 3
        @type = @type[0]
        @handed = @handed[2]
        @damage = [d8, d10]
        @damage_type = ['рубящий']
      end
    end



  end




  class Bow <Weapon


    def initialize
      @need_ammo = true
    end

    class LongBow
      def initialize(player)
        @name = 'long_bow'
        @price = {gold: 50}
        @weight = 2
        @type = @type[1]
        @handed = @handed[1]
        @damage = [d8]
        @damage_type = ['колющий']
        @disadvantage = player.size == 'small' ? true : false
        @bow_distance = {min: 150, max: 600}
      end
    end


  end






end