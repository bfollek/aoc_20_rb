require 'minitest/autorun'

require_relative "tree_counter"

class Day03 < Minitest::Test

  def test_day
    dir = File.dirname(__FILE__)
    file_name = File.join(dir, "#{dir}.dat")
    tree_counter = TreeCounter.new file_name
    assert_equal 207, tree_counter.count_trees_one_slope
    assert_equal 2655892800, tree_counter.count_and_multiply_trees_all_slopes
  end

end
