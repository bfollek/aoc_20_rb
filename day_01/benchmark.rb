#!/usr/bin/env ruby
# typed: strict

require 'benchmark'

require_relative 'accounting'

dir = File.dirname(__FILE__)
file_name = File.join(dir, "#{dir}.dat")
accounting = Accounting.new file_name
Benchmark.bmbm do |x|
  x.report('part_2') { accounting.find_three_entries }
  x.report('part_2_opt') { accounting.find_three_entries_optimized }
end