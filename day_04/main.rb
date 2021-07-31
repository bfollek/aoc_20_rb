#!/usr/bin/env ruby
# typed: true

require_relative 'day_04'

passports = Passport.load_from_file 'data/day_04.dat'
valid = passports.select { |pp| pp.has_required_fields? }
puts "part_1: #{valid.size}"
valid = passports.select { |pp| pp.valid? }
puts "part_2: #{valid.size}"
