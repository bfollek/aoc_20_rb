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

  # Your seat wasn't at the very front or back, though; the seats with IDs +1 and -1 from yours will be
  # in your list. So, sort by seat_id, then find the gap.
  def self.find_gap(boarding_passes)
    sorted = boarding_passes.sort_by(&:seat_id)
    prev_seat_id = sorted[0].seat_id
    sorted[1..].each do |bp|
      if bp.seat_id > prev_seat_id + 1
        return bp.seat_id - 1
      else
        prev_seat_id = bp.seat_id
      end
    end
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
