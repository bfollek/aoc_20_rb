Point = Struct.new(:x, :y)

class Day03

  TREE = '#'

  def initialize(file_name)
    @file_name = file_name
  end

  # part_1: 207
  def part_1
    load_grid
    p = Point.new(0, 0)
    cnt = 0
    loop do
      nxt = @grid[p.y][p.x]
      cnt += 1 if nxt == TREE
      puts "cnt == #{cnt}"
      p = move(p)
      return cnt if p.y == @grid.size
    end
  end

  # -------------------------------------------------------------------
  private
  # -------------------------------------------------------------------

  def load_grid
    @grid = []
    File.foreach(@file_name) do |line|
      @grid << line.chomp.split('')
    end
  end

  def move(point)
    point.x = (point.x + 3) % @grid[0].size
    point.y += 1
    point
  end

end