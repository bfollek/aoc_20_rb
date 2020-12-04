class Passport

  # hgt (Height) - a number followed by either cm or in:
  #     If cm, the number must be at least 150 and at most 193.
  #     If in, the number must be at least 59 and at most 76.
  HGT_RE = /\A(?<num>\d+)(?<unit>cm|in)\Z/

  # hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
  HCL_RE = /\A#[0-9a-f]{6}\Z/

  # ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
  ECL_RE = /\Aamb|blu|brn|gry|grn|hzl|oth\Z/

  # pid (Passport ID) - a nine-digit number, including leading zeroes.
  PID_RE = /\A\d{9}\Z/

  attr_accessor :byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid, :cid

  def self.load_from_file(file_name)
    passports = []
    pp = Passport.new
    File.foreach(file_name) do |line|
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

  def initialize
    @byr = nil
    @iyr = nil
    @eyr = nil
    @hgt = nil
    @hcl = nil
    @ecl = nil
    @pid = nil
    @cid = nil
  end

  def valid_part_1?
    return false if byr.nil?
    return false if iyr.nil?
    return false if eyr.nil?
    return false if hgt.nil?
    return false if hcl.nil?
    return false if ecl.nil?
    return false if pid.nil?
    # `cid` is optional
    true
  end

  def valid_part_2?
    return false unless valid_byr?
    return false unless valid_iyr?
    return false unless valid_eyr?
    return false unless valid_hgt?
    return false unless valid_hcl?
    return false unless valid_ecl?
    return false unless valid_pid?
    true
  end

  def parse(line)
    data = line.split(' ')
    data.each do |d|
      method, value = d.split(':')
      send("#{method}=", value)
    end
  end

# -------------------------------------------------------------------
  private
# -------------------------------------------------------------------

  # byr (Birth Year) - four digits; at least 1920 and at most 2002.
  def valid_byr?
    (1920..2002).include?  byr.to_i
  end

  # iyr (Issue Year) - four digits; at least 2010 and at most 2020.
  def valid_iyr?
    (2010..2020).include?  iyr.to_i
  end

  # eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
  def valid_eyr?
    (2020..2030).include?  eyr.to_i
  end

  def valid_hgt?
    matches = hgt&.match(HGT_RE)
    return false unless matches
    num = matches[:num]
    unit = matches[:unit]
    if unit == 'cm'
      bottom = 150
      top = 193
    else
      bottom = 59
      top = 76
    end
    (bottom..top).include? num.to_i
  end

  def valid_hcl?
    hcl&.match(HCL_RE)
  end

  def valid_ecl?
    ecl&.match(ECL_RE)
  end

  def valid_pid?
    pid&.match(PID_RE)
  end

end