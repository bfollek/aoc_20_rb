#!/usr/bin/env ruby
# typed: true

require_relative 'boarding_pass'

boarding_passes = BoardingPass.load_from_file 'data/day_05.dat'

# part_1: 826
part_1 = boarding_passes.max_by(&:seat_id).seat_id
puts "part_1: #{part_1}"

# part_2: 678
part_2 = BoardingPass.find_gap(boarding_passes)
puts "part_2: #{part_2}"