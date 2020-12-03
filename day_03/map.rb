class Map

  SNOW = '.'
  TREE = '#'

  def initialize(file_name)
    @grid = []
    File.foreach(file_name) do |line|
      @grid << line.chomp.split('')
    end
  end

  def rows
    @grid.size
  end

  def columns
    @grid[0].size
  end

# -------------------------------------------------------------------
private
# -------------------------------------------------------------------

end