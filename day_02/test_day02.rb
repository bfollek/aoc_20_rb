require 'minitest/autorun'

require_relative "passwords"

class Day02 < Minitest::Test

  def test_day_02
    dir = File.dirname(__FILE__)
    file_name = File.join(dir, "#{dir}.dat")
    passwords = Passwords.new file_name
    assert_equal 414, passwords.count_valid_old_way
    assert_equal 413, passwords.count_valid_new_way
  end

end