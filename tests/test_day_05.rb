require 'minitest/autorun'

require_relative "../day_05/boarding_pass"

class Day05 < Minitest::Test

  def test_day
    dir = File.dirname(__FILE__)
    file_name = File.join(dir, "../testdata/day_05.dat")
    boarding_passes = BoardingPass.load_from_file file_name
    assert_equal 826, boarding_passes.max_by(&:seat_id).seat_id
    assert_equal 678, BoardingPass.find_gap(boarding_passes)
  end

end