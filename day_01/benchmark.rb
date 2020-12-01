#!/usr/bin/env ruby
# typed: strict

require 'benchmark'

require_relative 'day_01'

day_01 = Day01.new '../data/day_01.txt'
Benchmark.bmbm do |x|
  x.report('part_2') { day_01.part_2 }
  x.report('part_2_opt') { day_01.part_2_opt }
end