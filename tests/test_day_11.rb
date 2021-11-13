require "minitest/autorun"

require_relative "../code/day_11/floor_plan"

class Day11 < Minitest::Test
  def test_day
    dir = File.dirname(__FILE__)
    file_name = File.join(dir, "../data/day_11.dat")
    floor_plan = FloorPlan.new file_name

    line_61 = "..L.L..L...L..L.L........L.L.LLL..L.L...LLL..L..........L........L....LLLL.LL...L......LL.."
    assert_equal line_61, floor_plan.layout[60].join, "Make sure we're loading rows correctly"
    assert_equal "L", floor_plan.layout[60][4], "Make sure we're loading columns correctly"

    changed = floor_plan.update_seat_state
    puts changed
  end
end
