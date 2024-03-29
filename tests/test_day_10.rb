require "minitest/autorun"

require_relative "../code/day_10/adapters"

class Day10 < Minitest::Test
  def test_day_small
    dir = File.dirname(__FILE__)

    file_name = File.join(dir, "../data/day_10_test_1.dat")
    adapters = Adapters.new file_name
    assert_equal 35, adapters.joltage_differences
    assert_equal 8, adapters.distinct_arrangements
  end

  def test_day_medium
    dir = File.dirname(__FILE__)

    file_name = File.join(dir, "../data/day_10_test_2.dat")
    adapters = Adapters.new file_name
    assert_equal 220, adapters.joltage_differences
    assert_equal 19208, adapters.distinct_arrangements
  end

  def test_day_large
    dir = File.dirname(__FILE__)

    file_name = File.join(dir, "../data/day_10.dat")
    adapters = Adapters.new file_name
    assert_equal 1848, adapters.joltage_differences
    assert_equal 8099130339328, adapters.distinct_arrangements
  end
end
