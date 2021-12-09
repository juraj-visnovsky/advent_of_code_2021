require_relative 'models/lanternfish_school'

input = File.open('./input.txt', 'r') { |io| io.read }.split(',').map(&:to_i)

school = LanternfishSchool.new(input)
p school.reproduce_and_count(256)