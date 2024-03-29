require "minitest/autorun"

require_relative "../code/day_04/passport"

class Day04 < Minitest::Test
  def test_day
    dir = File.dirname(__FILE__)
    file_name = File.join(dir, "../data/day_04.dat")
    passports = Passport.load_from_file file_name
    valid = passports.select { |pp| pp.has_required_fields? }
    assert_equal 196, valid.size
    valid = passports.select { |pp| pp.valid? }
    assert_equal 114, valid.size
  end
end
