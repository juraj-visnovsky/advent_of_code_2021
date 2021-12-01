depths = File.open('./input.txt', 'r') { |io| io.read }.split("\n").map(&:to_i)

increases = 0

depths.each_cons(2) do |current_depth, next_depth|
  increases += 1 if next_depth > current_depth
end

p increases
