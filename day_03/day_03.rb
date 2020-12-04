Point = Struct.new(:x, :y)

class Day03

  TREE = '#'

  def initialize(file_name)
    @file_name = file_name
  end

  # "Starting at the top-left corner of your map and following a slope of right 3 and down 1, how many trees would you encounter?"
  # part_1: 207
  def part_1
    slide(3, 1)
          # load_grid
          # p = Point.new(0, 0)
          # cnt = 0
          # loop do
          #   nxt = @grid[p.y][p.x]
          #   cnt += 1 if nxt == TREE
          #   p = move(p, 3, 1)
          #   return cnt if p.y == @grid.size
          # end
  end

  # "What do you get if you multiply together the number of trees encountered on each of the listed slopes?"
  def part_2
  end

  # -------------------------------------------------------------------
  private
  # -------------------------------------------------------------------

  def slide(add_x, add_y)
    load_grid
    p = Point.new(0, 0)
    cnt = 0
    loop do
      nxt = @grid[p.y][p.x]
      cnt += 1 if nxt == TREE
      p = move(p, add_x, add_y)
      return cnt if p.y == @grid.size
    end
  end

  def load_grid
    @grid = []
    File.foreach(@file_name) do |line|
      @grid << line.chomp.split('')
    end
  end

  def move(point, add_x, add_y)
    point.x = (point.x + add_x) % @grid[0].size
    point.y += add_y
    point
  end

end