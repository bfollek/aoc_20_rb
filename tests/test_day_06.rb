require "minitest/autorun"

require_relative "../code/day_06/group"

class Day06 < Minitest::Test
  def test_day
    dir = File.dirname(__FILE__)
    file_name = File.join(dir, "../testdata/day_06.dat")
    groups = Group.load_from_file file_name
    assert_equal 6748, Group.anyone_answered_yes(groups)
    assert_equal 3445, Group.everyone_answered_yes(groups)
  end
end
