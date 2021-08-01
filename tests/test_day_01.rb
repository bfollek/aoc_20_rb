require 'minitest/autorun'

require_relative "../day_01/accounting"

class Day01 < Minitest::Test

  def test_day
    dir = File.dirname(__FILE__)
    file_name = File.join(dir, "../testdata/day_01.dat")
    accounting = Accounting.new file_name
    assert_equal 744475, accounting.find_two_entries
    assert_equal 70276940, accounting.find_three_entries
    assert_equal 70276940, accounting.find_three_entries_optimized
  end

end