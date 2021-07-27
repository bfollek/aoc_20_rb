#!/usr/bin/env ruby

require_relative 'xmas'

xmas = Xmas.new 'data/day_09.dat', 25

puts "part_1: #{xmas.invalid_num}"
puts "part_2: #{xmas.encryption_weakness}"