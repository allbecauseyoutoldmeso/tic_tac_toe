class Player

  attr_reader :points, :symbol

  def initialize(symbol)
    @points = 0
    @symbol = symbol
  end

  def gain_points(num)
    self.points += num
  end

  private

  attr_writer :points

end
