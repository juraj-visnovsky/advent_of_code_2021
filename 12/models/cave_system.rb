class CaveSystem
  def initialize(input)
    @caves = Set.new
    @paths = Set.new

    input.each do |line|
      source_cave_name, target_cave_name = line.split('-')
      add(source_cave_name, target_cave_name)
    end
  end

  def paths(allow_visiting_small_cave_twice: false)
    paths = []

    stack = [['start']]

    until stack.empty?
      current_path = stack.shift
      neighbors(current_path.last).each do |cave|
        if cave.downcase == cave && current_path.include?(cave)
          next unless allow_visiting_small_cave_twice
          next if allow_visiting_small_cave_twice && current_path.tally.select { |k, v| k.downcase == k && v > 1 }.size > 0
        end

        new_path = current_path.dup.push(cave)

        if cave == 'end'
          paths << new_path
          next
        end

        stack << new_path
      end
    end

    paths
  end

  private
  def add(source_cave, target_cave)
    @caves << source_cave
    @caves << target_cave
    @paths << [source_cave, target_cave].sort
  end

  def neighbors(cave)
    @paths.filter { |path| path.include?(cave) }.flatten.difference([cave, 'start']).uniq
  end
end
