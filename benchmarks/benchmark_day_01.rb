#!/usr/bin/env ruby
# typed: strict

require 'benchmark'

require_relative '../day_01/accounting'

dir = File.dirname(__FILE__)
file_name = File.join(dir, "../testdata/day_01.dat")
accounting = Accounting.new file_name
Benchmark.bmbm do |x|
  x.report('find_three_entries') { accounting.find_three_entries }
  x.report('find_three_entries_optimized') { accounting.find_three_entries_optimized }
end