#!/usr/bin/env ruby
# typed: strict

require 'benchmark'

require_relative 'accounting'

accounting = Accounting.new 'data/day_01.dat'
Benchmark.bmbm do |x|
  x.report('part_2') { accounting.find_three_entries }
  x.report('part_2_opt') { accounting.find_three_entries_optimized }
end