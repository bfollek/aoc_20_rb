#!/usr/bin/env ruby
# typed: strict

require_relative 'adapters'

adapters = Adapters.new 'data/day_10.dat'

puts "part_1: #{adapters.joltage_check}"
