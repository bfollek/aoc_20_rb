#!/usr/bin/env ruby
# typed: strict

require_relative 'passwords'

passwords = Passwords.new 'data/day_02.dat'
puts "part_1: #{passwords.count_valid_old_way}"
puts "part_2: #{passwords.count_valid_new_way}"