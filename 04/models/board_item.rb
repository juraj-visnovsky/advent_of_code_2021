class BoardItem
  attr_reader :number, :row, :column

  def initialize(row, column, number)
    @marked = false
    @number = number
    @row = row
    @column = column
  end

  def is_marked?
    @marked
  end

  def mark
    @marked = true
  end
end
