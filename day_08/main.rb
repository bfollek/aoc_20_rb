#!/usr/bin/env ruby

require_relative 'console'

c = Console.new '../data/day_08.dat'

# part_1: 1446
_, acc = c.run
puts "part_1: #{acc}"