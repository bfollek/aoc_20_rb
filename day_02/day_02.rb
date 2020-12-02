# typed: true

require_relative 'password_entry'

class Day02

  def initialize(file_name)
    @file_name = file_name
  end

  # How many passwords are valid according to their policies?
  # part_1: 414
  def part_1
    cnt = 0
    File.foreach(@file_name) do |line|
      pe = PasswordEntry.new line
      cnt += 1 if pe.part_1_valid?
    end
    cnt
  end

  # part_2: 413
  def part_2
    cnt = 0
    File.foreach(@file_name) do |line|
      pe = PasswordEntry.new line
      cnt += 1 if pe.part_2_valid?
    end
    cnt
  end

end
