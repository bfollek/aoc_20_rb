# typed: false
class Adapters

  MIN_DIFF = 1
  MAX_DIFF = 3

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