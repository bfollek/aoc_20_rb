require "minitest/autorun"

require_relative "../code/day_11/floor_plan"

class Day11 < Minitest::Test
  EXPECTED_LINE_61 = "..L.L..L...L..L.L........L.L.LLL..L.L...LLL..L..........L........L....LLLL.LL...L......LL.."

  def setup
    dir = File.dirname(__FILE__)
    file_name = File.join(dir, "../data/day_11.dat")
    @floor_plan = FloorPlan.new file_name
  end

  def test_floor_plan
    assert_equal EXPECTED_LINE_61, @floor_plan.layout[60].join, "Make sure we're loading rows correctly"
    assert_equal "L", @floor_plan.layout[60][4], "Make sure we're loading columns correctly"
  end

  def test_num_occupied_adjacent
    assert_equal 0, @floor_plan.send("num_occupied_adjacent", 61, 2), "Nothing occupied at start"
  end

  def test_update_seat_state
    assert @floor_plan.send("update_seat_state"), "Seat state should change"
    assert_equal FloorPlan::OCCUPIED, @floor_plan.layout[61][2], "Seat should be occupied"
  end

  def test_day
    #assert_equal -1, @floor_plan.part_1
  end
end
