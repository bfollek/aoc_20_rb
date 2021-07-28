#!/usr/bin/env ruby
# typed: true

require_relative 'luggage'

MY_BAG = "shiny gold"

luggage = Luggage.load_from_file 'data/day_07.dat'
#luggage = Luggage.load_from_file 'data/day_07_test_1.dat' #part2 == 32
#luggage = Luggage.load_from_file 'data/day_07_test_2.dat' #part2 == 126

puts "part_1: #{luggage.count_paths_to_bag MY_BAG}"
puts "part_2: #{luggage.count_bags_in_bag MY_BAG}"