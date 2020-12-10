#!/usr/bin/env ruby

require 'minitest/autorun'

require_relative '../day_01/day_01'
require_relative '../day_02/day_02'
require_relative '../day_03/day_03'
require_relative '../day_04/day_04'
require_relative '../day_05/boarding_pass'
require_relative '../day_06/group'
require_relative '../day_07/luggage'
require_relative '../day_08/console'
require_relative '../day_08/instruction'
require_relative '../day_09/xmas'

class AllDays < Minitest::Test

  def test_day_01
    day = Day01.new 'day_01/data/day_01.dat'
    assert_equal 744475, day.part_1
    assert_equal 70276940, day.part_2_opt
  end

  def test_day_02
    day = Day02.new 'day_02/data/day_02.dat'
    assert_equal 414, day.part_1
    assert_equal 413, day.part_2
  end

  def test_day_03
    day = Day03.new 'day_03/data/day_03.dat'
    assert_equal 207, day.part_1
    assert_equal 2655892800, day.part_2
  end

  def test_day_04
    day = Day04.new 'day_04/data/day_04.dat'
    assert_equal 196, day.part_1
    assert_equal 114, day.part_2
  end

  def test_day_05
    boarding_passes = BoardingPass.load_from_file 'day_05/data/day_05.dat'
    assert_equal 826, boarding_passes.max_by(&:seat_id).seat_id
    assert_equal 678, BoardingPass.find_gap(boarding_passes)
  end

end
