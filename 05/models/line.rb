class Line
  attr_reader :from, :to

  def initialize(from, to)
    @from = from
    @to = to
  end

  def is_horizontal_or_vertical?
    @from.x == @to.x || @from.y == @to.y
  end

  def points
    # Bresenham's line algorithm
    x = @from.x
    y = @from.y

    diff_x = (@to.x - @from.x).abs
    diff_y = -(@to.y - @from.y).abs
    step_x = @from.x < @to.x ? 1 : -1
    step_y = @from.y < @to.y ? 1 : -1
    error = diff_x + diff_y

    points = [@from]

    until (x == @to.x && y == @to.y)
      e_two = 2 * error

      if e_two >= diff_y
        error += diff_y
        x += step_x
      end

      if e_two <= diff_x
        error += diff_x
        y += step_y
      end

      points << Point.new(x, y)
    end

    points
  end
end
