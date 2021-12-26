require 'set'
require_relative 'models/cave_system'

input = File.open('./input.txt', 'r') { |io| io.read }.split("\n")

cave_system = CaveSystem.new(input)
p cave_system.paths.count
