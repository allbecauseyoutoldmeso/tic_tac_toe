class Player

  attr_reader :fields

  def initialize
    @fields = []
  end

  def take(row, column)
    field = Field.new(row, column)
    fields.push field
  end

end
