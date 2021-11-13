require "minitest/autorun"

require_relative "../code/day_11/floor_plan"

class Day11 < Minitest::Test
  EXPECTED_LINE_6 = "L.LLLLL.LL"
  EXPECTED_LINE_61 = "..L.L..L...L..L.L........L.L.LLL..L.L...LLL..L..........L........L....LLLL.LL...L......LL.."

  def setup
    dir = File.dirname(__FILE__)
    file_name = File.join(dir, "../data/day_11_test_1.dat")
    @floor_plan_test_1 = FloorPlan.new file_name
  end

  def test_floor_plan
    assert_equal EXPECTED_LINE_6, @floor_plan_test_1.layout[5].join, "Make sure we're loading rows correctly"
    assert_equal "L", @floor_plan_test_1.layout[5][4], "Make sure we're loading columns correctly"
  end

  def test_num_occupied_adjacent
    assert_equal 0, @floor_plan_test_1.send("num_occupied_adjacent", 5, 2), "Nothing occupied at start"
  end

  def test_update_seat_state
    assert @floor_plan_test_1.send("update_seat_state"), "Seat state should change"
    @floor_plan_test_1.dump
    assert_equal FloorPlan::OCCUPIED, @floor_plan_test_1.layout[5][2], "Seat should be occupied"
  end

  def test_day
    #assert_equal -1, @floor_plan_test_1.part_1
  end
end
