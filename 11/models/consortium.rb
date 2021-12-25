class Consortium
  # https://www.theanimalfacts.com/glossary/animal-group-names/

  attr_reader :flashes

  def initialize(input)
    @matrix = input.split("\n").map { |line| line.chars.map(&:to_i) }
    @flashes = 0
    @octopuses_count = @matrix.inject(0) { |count, row| count += row.size }
  end

  def simulate(steps)
    step_flashes = nil

    steps.times do
      stack = []
      step_flashes = 0

      # increment all
      @matrix.each_with_index do |row, i|
        row.each_with_index do |_, j|
          @matrix[i][j] += 1

          if @matrix[i][j] > 9
            @flashes += 1
            step_flashes += 1
            stack += adjacent_coordinates(i, j)
          end
        end
      end

      # process adjacent
      until stack.empty?
        i, j = stack.shift
        next if @matrix[i][j] > 9

        @matrix[i][j] += 1

        if @matrix[i][j] > 9
          @flashes += 1
          step_flashes += 1
          stack.delete([i, j])
          stack += adjacent_coordinates(i, j)
        end
      end

      # reset
      @matrix.each_with_index do |row, i|
        row.each_with_index do |energy, j|
          @matrix[i][j] = 0 if energy > 9
        end
      end
    end

    step_flashes
  end

  def find_simultaneous_flash
    step = 0

    loop do
      step += 1
      step_flashes = simulate(1)

      return step if step_flashes == @octopuses_count
    end
  end

  private
  def adjacent_coordinates(i, j)
    coordinates = []

    coordinates << [i - 1, j] unless i - 1 < 0
    coordinates << [i, j - 1] unless j - 1 < 0
    coordinates << [i - 1, j - 1] unless i - 1 < 0 || j - 1 < 0
    coordinates << [i - 1, j + 1] unless i - 1 < 0 || j + 1 > @matrix[i].size - 1
    coordinates << [i + 1, j] unless i + 1 > @matrix.size - 1
    coordinates << [i, j + 1] unless j + 1 > @matrix[i].size - 1
    coordinates << [i + 1, j + 1] unless i + 1 > @matrix.size - 1 || j + 1 > @matrix[i].size - 1
    coordinates << [i + 1, j - 1] unless i + 1 > @matrix.size - 1 || j - 1 < 0

    coordinates
  end
end
