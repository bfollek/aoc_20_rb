require 'minitest/autorun'

require_relative "accounting"

class Day01 < Minitest::Test

  def test_day_01
    dir = File.dirname(__FILE__)
    file_name = File.join(dir, "#{dir}.dat")
    accounting = Accounting.new file_name
    assert_equal 744475, accounting.find_two_entries
    assert_equal 70276940, accounting.find_three_entries
    assert_equal 70276940, accounting.find_three_entries_optimized
  end

end