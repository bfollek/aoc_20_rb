#!/usr/bin/env ruby
# typed: true

require_relative 'tree_counter'

tree_counter = TreeCounter.new 'data/day_03.dat'
puts "part_1: #{tree_counter.count_trees_one_slope}"
puts "part_2: #{tree_counter.count_and_multiply_trees_all_slopes}"