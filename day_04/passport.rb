class Passport

  attr_accessor :byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid, :cid

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