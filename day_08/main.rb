#!/usr/bin/env ruby

require_relative 'instruction'
require_relative 'console'

c = Console.new
instructions = c.load_code '../data/day_08.dat'

# part_1: 1446
_, acc = c.run instructions
puts "part_1: #{acc}"