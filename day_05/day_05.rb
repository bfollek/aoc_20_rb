require_relative 'boarding_pass'

class Day05

  def initialize(file_name)
    @file_name = file_name
  end

  # part_1: 826
  def part_1
    boarding_passes = BoardingPass.load_from_file @file_name
    bp = boarding_passes.max_by { |bp| bp.seat_id }
    bp.seat_id
  end

  def part_2
    0
  end

end