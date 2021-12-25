require_relative 'lib/constants'
require_relative 'lib/string_ext'

input = File.open('./input.txt', 'r') { |io| io.read }.split("\n")

SYNTAX_ERROR_SCORES_TABLE = {
  ')' => 3,
  ']' => 57,
  '}' => 1197,
  '>' => 25137,
}

syntax_error_score = 0

input.each do |line|
  stack = []
  line.chars.each do |char|
    if char.opening_character?
      stack << char
      next
    end

    if char.closing_character? && stack.pop != LEGAL_PAIRS.invert[char]
      syntax_error_score += SYNTAX_ERROR_SCORES_TABLE[char]
      break
    end
  end
end

p syntax_error_score
