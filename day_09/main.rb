#!/usr/bin/env ruby

require_relative 'xmas'

xmas = Xmas.new 'data/day_09.dat', 25

# part_1: 1492208709
puts "part_1: #{xmas.invalid_num}"

# part_2: 238243506
puts "part_2: #{xmas.encryption_weakness}"