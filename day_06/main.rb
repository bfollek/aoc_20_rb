#!/usr/bin/env ruby
# typed: true

require_relative 'group'

groups = Group.load_from_file '../data/day_06.dat'

# "For each group, count the number of questions to which anyone answered "yes". What is the sum of those counts?"
i = groups.sum { |g| g.answers.size }
# part_1: 6748
puts "part_1: #{i}"

# "For each group, count the number of questions to which everyone answered "yes". What is the sum of those counts?"
i = groups.sum do |g|
  g.answers.values.select { |v| v == g.num_members } .size
end
# part_2: 3445
puts "part_2: #{i}"