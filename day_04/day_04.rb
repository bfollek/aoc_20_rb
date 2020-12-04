require_relative 'passport'

class Day04

  def initialize(file_name)
    @file_name = file_name
  end

  # part_1: 196
  def part_1
    passports = Passport.load_from_file @file_name
    valid = passports.select { |pp| pp.valid_part_1? }
    valid.size
  end

  # part_2: 114
  def part_2
    passports = Passport.load_from_file @file_name
    valid = passports.select { |pp| pp.valid_part_2? }
    valid.size
  end

end