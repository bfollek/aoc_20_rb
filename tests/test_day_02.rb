require 'minitest/autorun'

require_relative "../day_02/passwords"

class Day02 < Minitest::Test

  def test_day
    dir = File.dirname(__FILE__)
    file_name = File.join(dir, "../testdata/day_02.dat")
    passwords = Passwords.new file_name
    assert_equal 414, passwords.count_valid_old_way
    assert_equal 413, passwords.count_valid_new_way
  end

end