require_relative 'models/board_item'
require_relative 'models/board'

input = File.open('./input.txt', 'r') { |io| io.read }.split("\n")

numbers = []
boards = []
row = 0

input.each_with_index do |line, i|
  if i == 0
    numbers = line.split(',').map(&:to_i)
    next
  end

  if line == ''
    boards << Board.new
    row = 0
    next
  end

  line.strip.split(/\s+/).each_with_index do |value, column|
    number = value.chomp.to_i
    boards.last.add_item(row, column, number)
  end
  row += 1
end

numbers.each do |number|
  boards.each_with_index do |board, i|
    row, column = board.mark(number)
    if board.wins?(row, column)
      sum = board.items.select { |item| !item.is_marked? }.inject(0) { |sum, item| sum + item.number }
      p sum * number

      exit 1
    end
  end
end
