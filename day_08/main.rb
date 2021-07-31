#!/usr/bin/env ruby
# typed: strict

require_relative 'instruction'
require_relative 'console'

c = Console.new
instructions = c.load_code 'data/day_08.dat'

_, acc = c.run instructions
puts "part_1: #{acc}"

acc = c.swap_codes_and_run(instructions, Instruction::JUMP, Instruction::NO_OP)
puts "part_2: #{acc}"