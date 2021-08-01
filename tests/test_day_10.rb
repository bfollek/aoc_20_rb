require 'minitest/autorun'

require_relative "../day_10/adapters"

class Day10 < Minitest::Test

  def test_day
    dir = File.dirname(__FILE__)
    file_name = File.join(dir, "../testdata/day_10.dat")
    adapters = Adapters.new file_name
    assert_equal 1848, adapters.joltage_check
  end

end