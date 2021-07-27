#!/usr/bin/env ruby
# typed: true

require_relative 'group'

groups = Group.load_from_file 'data/day_06.dat'

puts "part_1: #{Group.anyone_answered_yes(groups)}"
puts "part_2: #{Group.everyone_answered_yes(groups)}"