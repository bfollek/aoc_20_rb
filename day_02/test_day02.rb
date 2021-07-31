require 'minitest/autorun'

require_relative "passwords"

class Day02 < Minitest::Test

  def test_day_02
    dir = File.dirname(__FILE__)
    file_name = File.join(dir, "#{dir}.dat")
    day = Accounting.new file_name
    assert_equal 744475, day.find_two_entries
    assert_equal 70276940, day.find_three_entries
    assert_equal 70276940, day.find_three_entries_optimized
  end

end