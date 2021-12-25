require_relative 'models/height_map'

input = File.open('./input.txt', 'r') { |io| io.read }

height_map = HeightMap.new(input)
p height_map.risk_levels_sum
