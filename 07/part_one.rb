require_relative 'models/fuel_consumption_calculator'

input = File.open('./input.txt', 'r') { |io| io.read }.split(',').map(&:to_i)

calculator = FuelConsumptionCalculator.new(input, :constant)
p calculator.get_min_fuel_consumption
