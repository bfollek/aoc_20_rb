class Day01

  GOAL = 2020

  def initialize(file_name)
    @file_name = file_name
  end

  # "...find the two entries that sum to 2020 and then multiply those two numbers together."
  # part_1: 744475
  def part_1
    entries = load_entries
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

  # Find the _3_ entries that sum to 2020.
  # part_2: 70276940
  def part_2
    entries = load_entries
    entries.each_with_index do |entry_i, i|
      entries.each_with_index do |entry_j, j|
        entries.each_with_index do |entry_k, k|
          case
          when i == j || i == k || j == k
            next
          when entry_i + entry_j + entry_k == GOAL
            return entry_i * entry_j * entry_k
          else
          end
        end
      end
    end
  end

  def part_2_opt
    entries = load_entries
    entries.each_with_index do |entry_i, i|
      entries.each_with_index do |entry_j, j|
        # Short-circuit when possible
        next if i == j || entry_i + entry_j >= GOAL
        entries.each_with_index do |entry_k, k|
          case
          when i == k || j == k
            next
          when entry_i + entry_j + entry_k == GOAL
            return entry_i * entry_j * entry_k
          else
          end
        end
      end
    end
  end

# -------------------------------------------------------------------
  private
# -------------------------------------------------------------------

  def load_entries
    entries = []
    File.foreach(@file_name) do |line|
      i = line.chomp.to_i
      # Hard-verify assumptions about the input data.
      raise "Found < 1: #{i}" if i < 1
      raise "Found >= GOAL: #{i}" if i >= GOAL
      entries << i
    end
    entries
  end

end