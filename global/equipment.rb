class Equipment

  attr_accessor :type
  attr_accessor :count
  attr_accessor :name
  attr_accessor :price
  attr_accessor :weight

  def initialize
    @count = 1
  end

  def arrow
    @type = 'ammo'
    @count *20
    @name = 'Стрелы'
    @price = {gold: 1}
    @weight = 1
  end

end