class Board

  attr_reader :scale

  def initialize(scale)
    @scale = scale
  end

  def generate_coordinates
    coordinates = []
    x=1 ; scale.times { y = 0 ; scale.times { coordinates.push [x,y+=1] } ; x+=1 }
    coordinates
  end

end
