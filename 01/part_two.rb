depths = File.open('./input.txt', 'r') { |io| io.read }.split("\n").map(&:to_i)
sums = depths.each_cons(3).map { |arr| arr.inject(&:+) }

increases = 0

sums.each_cons(2) do |current_sum, next_sum|
  increases += 1 if next_sum > current_sum
end

p increases
