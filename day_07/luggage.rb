require 'rgl/adjacency'
require 'rgl/path'

class Luggage

  # "dotted bronze bags contain 2 muted tomato bags."
  # dark red bags contain 2 wavy beige bags, 1 clear bronze bag, 5 shiny coral bags, 3 shiny indigo bags."
  RE_LINE = /(?<color>.+) bags contain (?<contents>[^.]+)/ # Up to, but not including, the period.

  # "light chartreuse bags contain no other bags."
  NO_BAGS = "no other bags"

  # "1 clear bronze bag" or "5 shiny coral bags"
  RE_CONTENTS =/(?<count>\d+) (?<color>.+) bags?/

  def initialize
    @g = RGL::DirectedAdjacencyGraph.new
    @contained_by = Hash.new(0) # 0 is default when key not found
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
        #puts "#{bag_color}, #{content_color}, #{content_count}"
        @contained_by[bag_color] += content_count
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

  def contains(b)
    total = 0
    @g.each_adjacent(b) do |adj|
      bag_cnt = @edge_weights[[b, adj]]
      total += (bag_cnt * contains(adj))
      puts "b: #{b}, adj: #{adj}, bag_cnt: #{bag_cnt}, total: #{total}"
    end
    total
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

  # Build a queue of vertices and an array of edges, then loop through edge weights and sum them.

  # TODO - I need to know how many bags each bag has...
  # Then I'll just need the bfs?
  def count_bags_in_bag(b)
    contains(b)
  end


#     edges = []
#     q = [b]
    
#     while ! q.empty?
#       v = q.pop
#       g.each_adjacent(v).each do |av|
#         q.prepend av
#         edge = [v, av]
#         #puts "edge: #{edge}, q.size: #{q.size}"
#         edges << edge
#       end
#     end
#     #1 + 1*7 + 2 + 2*11 = 32 bags!
#     total = 0
#     last_weight = 1

# #     shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
# #     dark olive bags contain 7 other bags: 3 faded blue bags and 4 dotted black bags.
# #     vibrant plum bags contain 11 other bags: 5 faded blue bags and 6 dotted black bags.
# #     faded blue bags contain 0 other bags.
# #     dotted black bags contain 0 other bags.

# # So, a single shiny gold bag must contain 1 dark olive bag (and the 7 bags within it) plus 2 vibrant 
# # plum bags (and the 11 bags within each of those): 1 + 1*7 + 2 + 2*11 = 32 bags!

# # How do I know to multiply vibrant plum by 2?

#     edges.each do |e|
#       edge_weight = edge_weights[e]
#       total += edge_weight
#       puts "edge: #{e}, edge_weight: #{edge_weight}, total: #{total}"
#       #total += (last_weight * edge_weight)
#       #last_weight = last_weight * edge_weight
#     end
#     total
#   end

end