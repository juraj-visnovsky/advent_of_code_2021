data = File.open('./input.txt', 'r') { |io| io.read }.split("\n").map(&:chars)

gamma_rate = ''
epsilon_rate = ''

data.transpose.each do |row|
  gamma_rate << row.max_by { |value| row.count(value) }
  epsilon_rate << row.min_by { |value| row.count(value) }
end.join

p gamma_rate.to_i(2) * epsilon_rate.to_i(2)
