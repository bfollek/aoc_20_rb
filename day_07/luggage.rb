require 'rgl/adjacency'
require 'rgl/path'

class Luggage

  attr_reader :edge_weights, :g # For irb debugging

  # "dotted bronze bags contain 2 muted tomato bags."
  # dark red bags contain 2 wavy beige bags, 1 clear bronze bag, 5 shiny coral bags, 3 shiny indigo bags."
  RE_LINE = /(?<color>.+) bags contain (?<contents>[^.]+)/ # Up to, but not including, the period.

  # "light chartreuse bags contain no other bags."
  NO_BAGS = "no other bags"

  # "1 clear bronze bag" or "5 shiny coral bags"
  RE_CONTENTS =/(?<count>\d+) (?<color>.+) bags?/

  def initialize
    @g = RGL::DirectedAdjacencyGraph.new
    @edge_weights = {}
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
        @edge_weights[[bag_color, content_color]] = content_count
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

# shiny gold
# wavy gold
# muted tomato
# posh tomato
# dull magenta
# muted fuchsia
# wavy beige
# dim gray
# shiny lime
# bright black
# clear bronze
# bright yellow
# dim turquoise
# pale fuchsia
# wavy gray
# vibrant salmon
# dotted beige
# clear purple
# faded salmon
# drab black
# shiny plum
# dark silver
# wavy brown
# shiny purple
# striped teal
# shiny indigo

  # "wavy gold bags contain 2 muted tomato bags, 5 posh tomato bags."

  # Build a queue of vertices and an array of edges, then loop through edge weights and sum them!
  def count_bags_in_bag(b)
    # Prime q with b
    g.each_adjacent(b).each do |av|
      puts av
    end
    0
  end

end