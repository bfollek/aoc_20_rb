#!/usr/bin/env ruby
# typed: strict

require_relative 'day_01'

day_01 = Day01.new 'data/day_01.dat'

# part_1: 744475
puts "part_1: #{day_01.part_1}"

# part_2: 70276940
puts "part_2: #{day_01.part_2}"
puts "part_2_opt: #{day_01.part_2_opt}"