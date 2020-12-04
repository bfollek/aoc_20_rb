Point = Struct.new(:x, :y)

class Day03

  TREE = '#'

  def initialize(file_name)
    @file_name = file_name
  end

  # "Starting at the top-left corner of your map and following a slope of right 3 and down 1, how many trees would you encounter?"
  # part_1: 207
  def part_1
    load_grid
    slide(3, 1)
  end

  # "What do you get if you multiply together the number of trees encountered on each of the listed slopes?"
  # part_2: 2655892800
  def part_2
    load_grid
    rv = 1
    slopes = [[1,1], [3,1], [5,1], [7,1], [1,2]]
    slopes.each do |slope|
      i = slide(slope[0], slope[1])
      rv *= i
    end
    rv
  end

  # -------------------------------------------------------------------
  private
  # -------------------------------------------------------------------

  def slide(add_x, add_y)
    p = Point.new(0, 0)
    cnt = 0
    loop do
      nxt = @grid[p.y][p.x]
      cnt += 1 if nxt == TREE
      p = move(p, add_x, add_y)
      return cnt if p.y >= @grid.size
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