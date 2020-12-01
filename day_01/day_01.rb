#!/usr/bin/env ruby

require 'benchmark'

GOAL = 2020

def get_entries(file_name)
  entries = []
  File.foreach(file_name) do |line|
    i = line.chomp.to_i
    raise "Found non-positive #{i}" if i < 1
    entries << i
  end
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

# Find the _3_ entries that sum to 2020.
# part_2: 70276940
def part_2(file_name)
  entries = get_entries(file_name)
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

def part_2_opt(file_name)
  entries = get_entries(file_name)
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

puts "part_1: #{part_1 '../data/day_01.txt'}"
puts "part_2: #{part_2 '../data/day_01.txt'}"
puts "part_2_opt: #{part_2_opt '../data/day_01.txt'}"

Benchmark.bm do |x|
  x.report { part_2 '../data/day_01.txt' }
  x.report { part_2_opt '../data/day_01.txt' }
end

# part_2_opt is much faster:


#
# day_01 (master)$ ./day_01.rb
# part_1: 744475
#        user     system      total        real
#  part_2: 70276940
#   0.131851   0.000506   0.132357 (  0.133337)
#  part_2_opt: 70276940
#   0.002707   0.000094   0.002801 (  0.002853)
# day_01 (master)$ ./day_01.rb
# part_1: 744475
#        user     system      total        real
#  part_2: 70276940
#   0.130629   0.000849   0.131478 (  0.132568)
#  part_2_opt: 70276940
#   0.002673   0.000063   0.002736 (  0.002736)