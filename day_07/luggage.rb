require 'rgl/adjacency'
require 'rgl/path'

# Monkeypatched from https://www.rubydoc.info/github/monora/rgl/RGL%2FGraph:bfs_search_tree_from
class RGL::DirectedAdjacencyGraph

  def dfs_search_tree_from(v)
    dfs  = dfs_iterator(v)
    tree = self.class.new

    dfs.set_tree_edge_event_handler do |from, to|
      tree.add_edge(from, to)
    end

    dfs.set_to_end # does the search
    tree
  end

end

class Luggage

  attr_reader :bag_counts, :g # For irb debugging

  # "dotted bronze bags contain 2 muted tomato bags."
  # dark red bags contain 2 wavy beige bags, 1 clear bronze bag, 5 shiny coral bags, 3 shiny indigo bags."
  RE_LINE = /(?<color>.+) bags contain (?<contents>[^.]+)/ # Up to, but not including, the period.

  # "light chartreuse bags contain no other bags."
  NO_BAGS = "no other bags"

  # "1 clear bronze bag" or "5 shiny coral bags"
  RE_CONTENTS =/(?<count>\d+) (?<color>.+) bags?/

  def initialize
    @g = RGL::DirectedAdjacencyGraph.new
    @bag_counts = {}
  end

  def self.load_from_file(file_name)
    l = self.new
    File.foreach(file_name) do |line|
      line = line.chomp
      matches = line.match(RE_LINE)
      if matches
        l.store_luggage(matches[:color], matches[:contents])
      else
        raise "Can't parse line #{line}"
      end
    end
    l
  end

  def store_luggage(bag_color, contents)
    @g.add_vertex(bag_color)
    return if contents == NO_BAGS
    a = contents.split(", ")
    a.each do |s|
      matches = s.match(RE_CONTENTS)
      if matches
        content_color = matches[:color]
        content_count = matches[:count].to_i
        @g.add_vertex(content_color)
        @g.add_edge(bag_color, content_color)
        @bag_counts["(#{bag_color}-#{content_color})"] = content_count
      else
        raise "Can't parse bag contents #{s}"
      end
    end
  end

  def count_paths_to_bag(b)
    cnt = 0
    @g.each_vertex do |v|
      next if v == b
      cnt += 1 if @g.path?(v, b)
    end
    cnt
  end

  def count_bags_in_bag(b)
    0
  end

end