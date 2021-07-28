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
require_relative '../day_10/adapters'

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

  def test_day_06
    groups = Group.load_from_file 'day_06/data/day_06.dat'
    assert_equal 6748, Group.anyone_answered_yes(groups)
    assert_equal 3445, Group.everyone_answered_yes(groups)
  end

  def test_day_07
    my_bag = "shiny gold"
    luggage = Luggage.load_from_file 'day_07/data/day_07.dat'
    assert_equal 235, luggage.count_paths_to_bag(my_bag)
    assert_equal 158493, luggage.count_bags_in_bag(my_bag)
  end

  def test_day_08
    c = Console.new
    instructions = c.load_code 'day_08/data/day_08.dat'

    _, acc = c.run instructions
    assert_equal 1446, acc

    assert_equal 1403, c.swap_codes_and_run(instructions, Instruction::JUMP, Instruction::NO_OP)
  end

  def test_day_09
    xmas = Xmas.new 'day_09/data/day_09.dat', 25
    assert_equal 1492208709, xmas.invalid_num
    assert_equal 238243506, xmas.encryption_weakness
  end

  def test_day_10
    adapters = Adapters.new 'day_10/data/day_10.dat'
    assert_equal 1848, adapters.joltage_check
  end

end
