class BoardingPass

  def initialize(scan)
    @raw_row = scan[0, 7]
    @raw_col = scan[-3, 3]
  end

  def row
    s = @raw_row.gsub('F', '0')
    s = s.gsub('B', '1')
    s.to_i(2)
  end

  def col
    s = @raw_col.gsub('L', '0')
    s = s.gsub('R', '1')
    s.to_i(2)
  end

  def seat_id
    row * 8 + col
  end

  def self.load_from_file(file_name)
    boarding_passes = []
    File.foreach(file_name) do |line|
      boarding_passes << self.new(line.chomp)
    end
    boarding_passes
  end

end
