require_relative 'passport'

class Day04

  def initialize(file_name)
    @file_name = file_name
  end

  # part_1: 196
  def part_1
    passports = load_passports
    cnt = 0
    passports.each do |pp|
      cnt += 1 if pp.valid?
    end
    cnt
  end

# -------------------------------------------------------------------
  private
# -------------------------------------------------------------------

  def load_passports
    passports = []
    pp = Passport.new
    File.foreach(@file_name) do |line|
      line = line.strip
      if line == ''
        passports << pp
        pp = Passport.new
      else
        pp.parse(line)
      end
    end
    # Don't forget the passport in progress when we hit EOF
    passports << pp
    passports
  end

end