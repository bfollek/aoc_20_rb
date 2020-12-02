# typed: true

require_relative 'password_entry'

class Day02

  def initialize(file_name)
    @file_name = file_name
  end

  # How many passwords are valid according to their policies?
  # part_1: 414
  def part_1
    looper { |pe| pe.part_1_valid? }
  end

  # part_2: 413
  def part_2
    looper { |pe| pe.part_2_valid? }
  end

# -------------------------------------------------------------------
  private
# -------------------------------------------------------------------

  def looper(&blk)
    cnt = 0
    File.foreach(@file_name) do |line|
      pe = PasswordEntry.new line
      cnt += 1 if yield pe
    end
    cnt
  end

end
