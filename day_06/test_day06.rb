require 'minitest/autorun'

require_relative "group"

class Day06 < Minitest::Test

  def test_day
    dir = File.dirname(__FILE__)
    file_name = File.join(dir, "#{dir}.dat")
    groups = Group.load_from_file file_name
    assert_equal 6748, Group.anyone_answered_yes(groups)
    assert_equal 3445, Group.everyone_answered_yes(groups)
  end

end