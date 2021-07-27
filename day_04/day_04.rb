require_relative 'passport'

class Day04

  def initialize(file_name)
    @file_name = file_name
  end

  def part_1
    passports = Passport.load_from_file @file_name
    valid = passports.select { |pp| pp.valid_part_1? }
    valid.size
  end

  def part_2
    passports = Passport.load_from_file @file_name
    valid = passports.select { |pp| pp.valid_part_2? }
    valid.size
  end

end