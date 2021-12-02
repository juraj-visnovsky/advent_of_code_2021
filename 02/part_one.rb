instructions = File.open('./input.txt', 'r') { |io| io.read }.split("\n")

position = {
  horizontal: 0,
  depth: 0,
}

instructions.each do |instruction|
  direction, step = instruction.split(/\s+/)
  step = step.to_i

  case direction
  when 'forward'
    position[:horizontal] += step
  when 'up'
    position[:depth] -= step
  when 'down'
    position[:depth] += step
  end
end

p position[:horizontal] * position[:depth]
