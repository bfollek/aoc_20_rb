require 'minitest/autorun'

require_relative "adapters"

class Day10 < Minitest::Test

  def test_day
    dir = File.dirname(__FILE__)
    file_name = File.join(dir, "#{dir}.dat")
    adapters = Adapters.new file_name
    assert_equal 1848, adapters.joltage_check
  end

end