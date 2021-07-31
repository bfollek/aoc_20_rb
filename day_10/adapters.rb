# typed: false
class Adapters

  def initialize file_name
    @adapters = []
    File.foreach(file_name) { |line| @adapters << line.chomp.to_i }
    # In addition, your device has a built-in joltage adapter rated for 3 jolts higher than the highest-rated
    # adapter in your bag. (If your adapter list were 3, 9, and 6, your device's built-in adapter would be rated
    # for 12 jolts.)
    @adapters << @adapters.max + 3
  end

  def joltage_check
    adapters = @adapters.sort
    j1_diff = 0
    j3_diff = 0
    prev = 0 # Starting joltage
    adapters.each do |a|
      case a - prev
      when 1
        j1_diff += 1
      when 3
        j3_diff += 1
      else
      end
      prev = a
    end
    j1_diff * j3_diff
  end

end