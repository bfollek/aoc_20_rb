# typed: false

require 'rgl/adjacency'

class Adapters

  # "The charging outlet has an effective rating of 0 jolts..."
  CHARGING_OUTLET = 0
  # "Any given adapter can take an input 1, 2, or 3 jolts lower than its rating 
  # and still produce its rated output joltage."
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
    g = build_graph
    cnt = 0
    q = [@adapters[0]]
    goal = @adapters.last
    # TODO The same node may show up multiple times. memoize?
    while !q.empty?
      v = q.pop
      g.each_adjacent(v) do |adj|
        if adj == goal
          cnt += 1
        else
          q << adj
        end
      end
    end
    return cnt
  end

# -------------------------------------------------------------------
  private
# -------------------------------------------------------------------

  def build_graph
    g = RGL::DirectedAdjacencyGraph.new
    @adapters.each_with_index do |a, i|
      (i+1..@adapters.size - 1).each do |j| 
        a_nxt = @adapters[j]
        # If this adapter can reach the next one, add an edge.
        if a + MAX_DIFF >= a_nxt
          g.add_edge(a, a_nxt)
        else
          break # inner loop - out of range == done
        end
      end
    end
    # Remember that g.to_s sorts alpha, which can be misleading.
    # https://www.rubydoc.info/github/monora/rgl/RGL/Graph#to_s-instance_method
    #puts "g: #{g}" 
    g
  end

end