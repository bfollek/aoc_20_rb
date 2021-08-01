# typed: false
class Adapters

  # "The charging outlet has an effective rating of 0 jolts..."
  CHARGING_OUTLET = 0
  MIN_DIFF = 1
  MAX_DIFF = 3

  def initialize file_name
    @adapters = [CHARGING_OUTLET]
    File.foreach(file_name) { |line| @adapters << line.chomp.to_i }
    @adapters.sort!
    # "In addition, your device has a built-in joltage adapter rated for 3 jolts higher 
    # than the highest-rated adapter in your bag. (If your adapter list were 3, 9, and 6, 
    # your device's built-in adapter would be rated for 12 jolts.)"
    @adapters << @adapters.last + 3
  end

  # "What is the number of 1-jolt differences multiplied by the number of 3-jolt differences?"
  def joltage_differences
    j1_diff = 0
    j3_diff = 0
    prev = CHARGING_OUTLET # Starting joltage
    @adapters.each do |a|
      case a - prev
      when MIN_DIFF
        j1_diff += 1
      when MAX_DIFF
        j3_diff += 1
      else
      end
      prev = a
    end
    j1_diff * j3_diff
  end

  # "What is the total number of distinct ways you can arrange the adapters to connect
  # the charging outlet to your device?"
  def distinct_arrangements
    0
  end

  %{

    I should be able to build the graph such that only nodes within range have edges.
    nodes.each_with_index do |i, n|
      nodes(i+1..).each do |other|
        if other - MAX_JOLT <= n
          add_edge(n, other)
        else
          break
        end
    end

  # cnt = 0
  # q = [start]
  # while !q.empty?
  #   v = q.pop
  #   v.each_adjacent do |adj|
  #     if adj == end
  #       cnt += 1
  #     else
  #       q << adj
  #     end
  #   end
  # end
  # return cnt

  The same node may show up multiple times. memoize its trip?
  }

end