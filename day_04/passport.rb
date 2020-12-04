class Passport

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

  def valid?
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

  def parse(line)
    data = line.split(' ')
    data.each do |d|
      method, value = d.split(':')
      send("#{method}=", value)
    end
  end

end