require_relative 'lib/constants'
require_relative 'lib/string_ext'

input = File.open('./input.txt', 'r') { |io| io.read }.split("\n")

SCORES_TABLE = {
  ')' => 1,
  ']' => 2,
  '}' => 3,
  '>' => 4,
}

scores = []

input.each do |line|
  catch :corrupted do
    stack = []
    line.chars.each do |char|
      if char.opening_character?
        stack << char
        next
      end

      throw :corrupted if char.closing_character? && stack.pop != LEGAL_PAIRS.invert[char]
    end

    score = 0

    stack.reverse.each do |char|
      score = score * 5 + SCORES_TABLE[LEGAL_PAIRS[char]]
    end

    scores << score
  end
end

p scores.sort[scores.length / 2]
