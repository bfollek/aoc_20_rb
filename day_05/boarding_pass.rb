class BoardingPass

  def initialize(scan)
    @row = binary_value(scan[0, 7], 'F', 'B')
    @col = binary_value(scan[-3, 3], 'L', 'R')
  end

  def seat_id
    @row * 8 + @col
  end

  def self.load_from_file(file_name)
    boarding_passes = []
    File.foreach(file_name) do |line|
      boarding_passes << self.new(line.chomp)
    end
    boarding_passes
  end

# -------------------------------------------------------------------
  private
# -------------------------------------------------------------------

  def binary_value(s, zero_char, one_char)
    s = s.gsub(zero_char, '0')
    s = s.gsub(one_char, '1')
    s.to_i(2)
  end

end
