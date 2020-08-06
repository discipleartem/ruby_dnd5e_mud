class Armor


  attr_accessor :type
  attr_accessor :dc
  attr_accessor :price
  attr_accessor :disadvantage
  attr_accessor :need_str
  attr_accessor :weight
  attr_accessor :name

  def initialize
    @type = ['light_armor', 'medium_armor', 'heavy_armor', 'shield']
    @disadvantage = true
    @need_str = nil
  end


  def chain_mail(player)
    @name = 'Кольчуга'
    @price = {gold: 75}
    @dc = 16
    @need_str = 13
    @weight = 55
  end


  def leather_armor(player)
    @name = 'Кожанный доспех'
    @price = {gold: 10}
    @dc = 11 + player.main_stat[:DEX]
    @weight = 10
  end



end