require 'rgl/adjacency'
require 'rgl/path'

class Luggage

  attr_reader :g # For irb debugging

  # "dotted bronze bags contain 2 muted tomato bags."
  # dark red bags contain 2 wavy beige bags, 1 clear bronze bag, 5 shiny coral bags, 3 shiny indigo bags."
  RE_LINE = /(?<color>.+) bags contain (?<contents>[^.]+)/ # Up to, but not including, the period.

  # "light chartreuse bags contain no other bags."
  NO_BAGS = "no other bags"

  # "1 clear bronze bag" or "5 shiny coral bags"
  RE_CONTENTS =/(?<count>\d+) (?<color>.+) bags?/

  def initialize
    @g = RGL::DirectedAdjacencyGraph.new
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

end