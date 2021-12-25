require_relative 'models/height_map'

input = File.open('./input.txt', 'r') { |io| io.read }

height_map = HeightMap.new(input)
largest_basins = height_map.basins.map { |basin| [basin, basin.size] }.to_h.sort_by  { |k, v| -v }.to_h.values.first(3)

p largest_basins.inject(&:*)
