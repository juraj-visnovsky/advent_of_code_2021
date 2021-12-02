instructions = File.open('./input.txt', 'r') { |io| io.read }.split("\n")

position = {
  horizontal: 0,
  depth: 0,
  aim: 0,
}

instructions.each do |instruction|
  direction, step = instruction.split(/\s+/)
  step = step.to_i

  case direction
  when 'forward'
    position[:horizontal] += step
    position[:depth] += step * position[:aim]
  when 'up'
    position[:aim] -= step
  when 'down'
    position[:aim] += step
  end
end

p position[:horizontal] * position[:depth]
