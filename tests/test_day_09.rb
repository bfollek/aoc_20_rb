require 'minitest/autorun'

require_relative "../day_09/xmas"

class Day_09 < Minitest::Test

  def test_day
    dir = File.dirname(__FILE__)
    file_name = File.join(dir, "../testdata/day_09.dat")
    xmas = Xmas.new file_name, 25
    assert_equal 1492208709, xmas.invalid_num
    assert_equal 238243506, xmas.encryption_weakness
  end

end