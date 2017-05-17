class Field

  attr_reader :row, :column, :taken
  attr_writer :taken

  def initialize(row, column)
    @row = row
    @column = column
    @taken = false
  end



end
