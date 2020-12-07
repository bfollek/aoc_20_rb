
require 'rgl/adjacency'
require 'rgl/dot'
require 'rgl/traversal'

class Luggage

  # "dotted bronze bags contain 2 muted tomato bags."
  # dark red bags contain 2 wavy beige bags, 1 clear bronze bag, 5 shiny coral bags, 3 shiny indigo bags."
  RE = /(?<color>.+) bags contain (?<contents>[^.]+)/ # Up to, but not including, the period.

  attr_reader :graph

  def initialize
    @graph = RGL::DirectedAdjacencyGraph.new
  end

  def draw
  end

  def self.load_from_file(file_name)
    l = self.new
    File.foreach(file_name) do |line|
      line = line.chomp
      matches = line.match(RE)
      if matches
        cnt += 1
        color = matches[:color]
        l.graph.add_vertex(color) unless l.graph.has_vertex?(color)
        contents = matches[:contents]
        puts "#{color}, #{contents}, #{l.graph.num_vertices}"
      else
        raise "Can't parse #{line}"
      end
    end
    l
  end

end