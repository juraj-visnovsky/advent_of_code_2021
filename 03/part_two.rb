data = File.open('./input.txt', 'r') { |io| io.read }.split("\n").map(&:chars)

oxygen_criteria = {
  1 => '0',
  0 => '1',
  -1 => '1',
}

co_two_criteria = {
  1 => '1',
  0 => '0',
  -1 => '0',
}

oxygen_candidates = data.dup
co_two_candidates = data.dup

data.each_with_index do |_, i|
  if oxygen_candidates.size > 1
    oxygen_comparison = oxygen_candidates.transpose[i].count('0') <=> oxygen_candidates.transpose[i].count('1')
    oxygen_candidates.select! { |value| value[i] == oxygen_criteria[oxygen_comparison] }
  end

  if co_two_candidates.size > 1
    co_two_comparison = co_two_candidates.transpose[i].count('0') <=> co_two_candidates.transpose[i].count('1')
    co_two_candidates.select! { |value| value[i] == co_two_criteria[co_two_comparison] }
  end

  break if oxygen_candidates.size == 1 && co_two_candidates.size == 1
end

p oxygen_candidates[0].join.to_i(2) * co_two_candidates[0].join.to_i(2)
