require 'minitest/autorun'

require_relative "luggage"

class Day07 < Minitest::Test

  def test_day
    dir = File.dirname(__FILE__)
    file_name = File.join(dir, "#{dir}.dat")
    my_bag = "shiny gold"
    luggage = Luggage.load_from_file file_name
    assert_equal 235, luggage.count_paths_to_bag(my_bag)
    assert_equal 158493, luggage.count_bags_in_bag(my_bag)
  end

end