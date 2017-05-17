class Field

  attr_reader :row, :column
  attr_accessor :taken

  def initialize(row, column)
    @row = row
    @column = column
    @taken = false
  end

end
