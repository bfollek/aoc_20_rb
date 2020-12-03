require 'minitest/autorun'
require_relative '../../day_03/map'

class MapTest < Minitest::Test

  def test_grid_size
    m = Map.new "data/day_03_test.dat"
    assert_equal 11, m.rows, "Right number of rows"
    assert_equal 66, m.columns, "Right number of columns"
  end

end