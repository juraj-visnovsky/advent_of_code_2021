class FuelConsumptionCalculator
  STRATEGIES = {
    constant: :constant_consumption,
    expensive: :expensive_consumption,
  }.freeze
  DEFAULT_STRATEGY = :constant_consumption

  def initialize input, strategy
    @positions = input
    @strategy = STRATEGIES.fetch(strategy, DEFAULT_STRATEGY)
  end

  def get_min_fuel_consumption
    from = @positions.min
    to = @positions.max
    min_fuel_consumption = nil

    (from..to).each do |target_position|
      fuel_consumption = 0

      @positions.each do |position|
        fuel_consumption += self.public_send(@strategy, target_position, position)
        break if !min_fuel_consumption.nil? && min_fuel_consumption < fuel_consumption
      end

      if min_fuel_consumption.nil? || min_fuel_consumption > fuel_consumption
        min_fuel_consumption = fuel_consumption
      end
    end

    min_fuel_consumption
  end

  def constant_consumption target_position, current_position
    (target_position - current_position).abs
  end

  def expensive_consumption target_position, current_position
    distance = (target_position - current_position).abs
    distance * (distance + 1) / 2
  end
end