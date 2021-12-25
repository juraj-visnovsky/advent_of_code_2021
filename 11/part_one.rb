require_relative 'models/consortium'

input = File.open('./input.txt', 'r') { |io| io.read }

consortium = Consortium.new(input)
consortium.simulate(100)

p consortium.flashes
