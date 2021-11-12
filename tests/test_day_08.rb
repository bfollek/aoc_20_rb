require "minitest/autorun"

require_relative "../code/day_08/console"

class Day08 < Minitest::Test
  def test_day
    dir = File.dirname(__FILE__)
    file_name = File.join(dir, "../testdata/day_08.dat")
    c = Console.new
    instructions = c.load_code file_name
    _, acc = c.run instructions
    assert_equal 1446, acc
    assert_equal 1403, c.swap_codes_and_run(instructions, Instruction::JUMP, Instruction::NO_OP)
  end
end
