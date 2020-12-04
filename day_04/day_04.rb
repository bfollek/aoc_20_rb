require_relative 'passport'

class Day04

  def initialize(file_name)
    @file_name = file_name
  end

  # part_1: 196
  def part_1
    passports = Passport.load_from_file @file_name
    cnt = 0
    passports.each do |pp|
      cnt += 1 if pp.valid?
    end
    cnt
  end

  def part_2
    passports = Passport.load_from_file @file_name
    cnt = 0
    #passports.each do |pp|
    #  cnt += 1 if pp.valid?
    #end
    cnt
  end

end