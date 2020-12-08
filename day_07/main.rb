#!/usr/bin/env ruby
# typed: true

require_relative 'luggage'

MY_BAG = "shiny gold"

luggage = Luggage.load_from_file '../data/day_07.dat'

# part_1: 235
puts "part_1: #{luggage.count_paths_to_bag MY_BAG}"

# part_2: ???
puts "part_2: #{luggage.count_bags_in_bag MY_BAG}"