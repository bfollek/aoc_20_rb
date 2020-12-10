#!/usr/bin/env ruby
# typed: true

require_relative 'boarding_pass'

boarding_passes = BoardingPass.load_from_file 'data/day_05.dat'

# part_1: 826
#part_1 = boarding_passes.max_by { |bp| bp.seat_id } .seat_id
part_1 = boarding_passes.max_by(&:seat_id).seat_id
puts "part_1: #{part_1}"

# Your seat wasn't at the very front or back, though; the seats with IDs +1 and -1 from yours will be in your list.
# So, sort by seat_id, then find the gap.
# part_2: 678
sorted = boarding_passes.sort_by(&:seat_id)
prev_seat_id = sorted[0].seat_id
sorted[1..].each do |bp|
  if bp.seat_id > prev_seat_id + 1
    puts "part_2: #{bp.seat_id - 1}"
    break
  else
    prev_seat_id = bp.seat_id
  end
end
