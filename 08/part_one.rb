input = File.open('./input.txt', 'r') { |io| io.read }.split("\n")

SEGMENT_LENGTHS_DIGITS_MAP = {
  2 => 1,
  3 => 7,
  4 => 4,
  7 => 8,
}

occurrences = 0

input.each do |line|
  output_values = line.scan(/[a-g]+/).last(4)
  known_digits = output_values.map { |value| SEGMENT_LENGTHS_DIGITS_MAP[value.length] }.compact
  occurrences += known_digits.length
end

p occurrences
