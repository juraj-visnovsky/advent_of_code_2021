input = File.open('./input.txt', 'r') { |io| io.read }.split("\n")

class String
  def contains_segment?(other)
    return false if other.nil?
    other.chars.all? { |char| self.include?(char) }
  end

  def segment_distance(other)
    (other.chars - self.chars).size
  end
end

result = 0

input.each do |line|
  values = line.scan(/[a-g]+/).map { |value| value.chars.sort.join }
  digits = {}
  # Know digits
  digits[1] = values.detect { |value| value.length == 2 }
  digits[4] = values.detect { |value| value.length == 4 }
  digits[7] = values.detect { |value| value.length == 3 }
  digits[8] = values.detect { |value| value.length == 7 }
  # 6-segment digits
  digits[0] = values.detect { |value| value.length == 6 && value.contains_segment?(digits[1]) && !value.contains_segment?(digits[4]) }
  digits[6] = values.detect { |value| value.length == 6 && !value.contains_segment?(digits[1]) && !value.contains_segment?(digits[4]) }
  digits[9] = values.detect { |value| value.length == 6 && value.contains_segment?(digits[1]) && value.contains_segment?(digits[4]) }
  # 5-segment digits
  digits[2] = values.detect { |value| value.length == 5 && !value.contains_segment?(digits[1]) && value.segment_distance(digits[6]) == 2 }
  digits[3] = values.detect { |value| value.length == 5 && value.contains_segment?(digits[1]) }
  digits[5] = values.detect { |value| value.length == 5 && !value.contains_segment?(digits[1]) && value.segment_distance(digits[6]) == 1 }

  result += values.last(4).map { |value| digits.invert[value].to_s }.join.to_i
end

p result
