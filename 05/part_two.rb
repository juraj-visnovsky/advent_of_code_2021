require_relative 'models/point'
require_relative 'models/line'

input = File.open('./input.txt', 'r') { |io| io.read }.split("\n")

lines = []
map = Hash.new(0)

input.each do |data|
  x_one, y_one, x_two, y_two = data.match(/^(\d+),(\d+)\s+->\s+(\d+),(\d+)$/).captures
  line = Line.new(Point.new(x_one.to_i, y_one.to_i), Point.new(x_two.to_i, y_two.to_i))

  lines << line

  line.points.each do |point|
    map[point] += 1
  end
end

p map.select { |_, v| v > 1 }.count
