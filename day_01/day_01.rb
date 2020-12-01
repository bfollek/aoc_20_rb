GOAL = 2020

def get_entries(file_name)
  entries = []
  File.foreach(file_name) {|line| entries << line.chomp.to_i }
  entries
end

# "...find the two entries that sum to 2020 and then multiply those two numbers together."
# part_1: 744475
def part_1(file_name)
  entries = get_entries(file_name)
  entries.each_with_index do |entry_i, i|
    entries.each_with_index do |entry_j, j|
      case
      when i == j
        next
      when entry_i + entry_j == GOAL
        return entry_i * entry_j
      else
      end
    end
  end
end

puts "part_1: #{part_1 '../data/day_01.txt'}"