require 'delegate'

require 'rgl/adjacency'
require 'rgl/dot'
require 'rgl/traversal'

class Luggage < SimpleDelegator # So that we 'inherit' the graph methods

  # "dotted bronze bags contain 2 muted tomato bags."
  # dark red bags contain 2 wavy beige bags, 1 clear bronze bag, 5 shiny coral bags, 3 shiny indigo bags."
  RE = /(?<color>.+) bags contain (?<contents>[^.]+)/ # Up to, but not including, the period.

  def draw
  end

  def self.load_from_file(file_name)
    l = self.new(RGL::DirectedAdjacencyGraph.new)
    File.foreach(file_name) do |line|
      line = line.chomp
      matches = line.match(RE)
      if matches
        color = matches[:color]
        l.add_vertex(color) unless l.has_vertex?(color)
        contents = matches[:contents]
        puts "#{color}, #{contents}, #{l.num_vertices}"
      else
        raise "Can't parse #{line}"
      end
    end
    l
  end

end