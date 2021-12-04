class Board
  attr_reader :items, :won

  def initialize
    @items = []
    @rows = 0
    @columns = 0
    @won = false
  end

  def add_item(row, column, number)
    @items << BoardItem.new(row, column, number)
    @rows = [@rows, row].max
    @columns = [@columns, column].max
  end

  def mark(number)
    return if @won

    item = @items.find { |i| i.number == number }

    return if item.nil?

    item.mark
    [item.row, item.column]
  end

  def wins?(row, column)
    return false if row.nil? || column.nil?

    @won ||= @items.select { |item| item.row == row }.all? { |item| item.is_marked? } ||
      @items.select { |item| item.column == column }.all? { |item| item.is_marked? }

    @won
  end
end
