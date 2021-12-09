class LanternfishSchool
  def initialize(data)
    @data = data
  end

  def reproduce_and_count(days)
    counter = Hash.new(0)

    @data.each do |value|
      counter[value] += 1
    end

    days.times do |_|
      new_counter = {
        6 => counter[0],
        8 => counter[0],
      }
      new_counter.default = 0

      counter.each do |key, value|
        next if key == 0
        new_counter[key - 1] += value
      end

      counter = new_counter
    end

    counter.values.inject(:+)
  end
end
