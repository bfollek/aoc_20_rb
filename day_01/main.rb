#!/usr/bin/env ruby
# typed: strict

require_relative 'accounting'

accounting = Accounting.new 'data/day_01.dat'

puts "part_1: #{accounting.find_two_entries}"
puts "part_2: #{accounting.find_three_entries}"
puts "part_2_opt: #{accounting.find_three_entries_optimized}"