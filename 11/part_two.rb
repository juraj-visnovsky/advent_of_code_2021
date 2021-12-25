require_relative 'models/consortium'

input = File.open('./input.txt', 'r') { |io| io.read }

consortium = Consortium.new(input)
p consortium.find_simultaneous_flash
