require "minitest/autorun"

require_relative "../code/day_11/floor_plan"

class Day11 < Minitest::Test
  EXPECTED_LINE_6 = "L.LLLLL.LL"

  def setup
    dir = File.dirname(__FILE__)
    file_name = File.join(dir, "../data/day_11_test_1.dat")
    @floor_plan_test_1 = FloorPlan.new file_name
  end

  def test_1_floor_plan
    assert_equal EXPECTED_LINE_6, @floor_plan_test_1.layout[5].join, "Make sure we're loading rows correctly"
    assert_equal "L", @floor_plan_test_1.layout[5][4], "Make sure we're loading columns correctly"
  end

  def test_1_num_occupied_adjacent
    assert_equal 0, @floor_plan_test_1.send("num_occupied_adjacent", 5, 2), "Nothing occupied at start"
  end

  def test_1_update_seat_state
    assert @floor_plan_test_1.send("update_seat_state"), "Seat state should change"
    assert_equal FloorPlan::OCCUPIED, @floor_plan_test_1.layout[5][2], "Seat should be occupied"
  end

  def test_1_part_1
    assert_equal 37, @floor_plan_test_1.part_1
  end

  def test_day_part_1
    dir = File.dirname(__FILE__)
    file_name = File.join(dir, "../data/day_11.dat")
    @floor_plan = FloorPlan.new file_name
    assert_equal 2275, @floor_plan.part_1
  end
end
