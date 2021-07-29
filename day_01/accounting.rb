# typed: strict

require 'sorbet-runtime'

class Accounting
  extend T::Sig

  GOAL = 2020
  NO_SOLUTION = "If we got here, we didn't find a solution."

  sig { params(file_name: String).void }
  def initialize(file_name)
    @file_name = file_name
  end

  # "...find the two entries that sum to 2020 and then multiply those two numbers together."
  sig { returns(Integer) }
  def find_two_entries
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
    raise NO_SOLUTION
  end

  # Find the _3_ entries that sum to 2020.
  sig { returns(Integer) }
  def find_three_entries
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
    raise NO_SOLUTION
  end

  sig { returns(Integer) }
  def find_three_entries_optimized
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
    raise NO_SOLUTION
  end

# -------------------------------------------------------------------
  private
# -------------------------------------------------------------------

  sig { returns(T::Array[Integer]) }
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