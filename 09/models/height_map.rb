class HeightMap
  def initialize(input)
    @matrix = input.split("\n").map { |line| line.chars.map(&:to_i) }
  end

  def risk_levels_sum
    low_points.inject(0) { |sum, value| sum += value + 1 }
  end

  def basins
    basins = []
    @matrix.each_with_index do |row, i|
      row.each_with_index do |value, j|
        next unless adjacent_values(i, j).all? { |adjacent_value| adjacent_value > value }

        basin = []
        visited = []
        stack = [[i, j]]
        until stack.empty? do
          x, y = stack.shift
          next if visited.include?([x,y])

          unless @matrix[x][y] == 9
            basin << [x, y]
            adjacent_coordinates(x, y).each { |neighbor| stack.push(neighbor) unless stack.include?(neighbor) || visited.include?(neighbor) }
          end

          visited << [x, y]
        end

        basins << basin unless basin.empty?
      end
    end

    basins
  end

  private
  def low_points
    low_points = []
    @matrix.each_with_index do |row, i|
      row.each_with_index do |value, j|
        low_points << value if adjacent_values(i, j).all? { |adjacent_value| adjacent_value > value }
      end
    end

    low_points
  end

  def adjacent_values(i, j)
    adjacent_coordinates(i, j).map { |x, y| @matrix[x][y] }
  end

  def adjacent_coordinates(i, j)
    coordinates = []

    coordinates << [i - 1, j] unless i - 1 < 0
    coordinates << [i, j - 1] unless j - 1 < 0
    coordinates << [i + 1, j] unless i + 1 > @matrix.size - 1
    coordinates << [i, j + 1] unless j + 1 > @matrix[i].size - 1

    coordinates
  end
end
