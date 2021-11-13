class FloorPlan
  FLOOR = "."
  EMPTY = "L"
  OCCUPIED = "#"

  attr_reader :layout

  def initialize(file_name)
    @layout = []
    File.foreach(file_name) do |line|
      @layout << line.chomp.split("")
    end
    @max_rows = @layout.size
    @max_cols = @layout[0].size
    #puts "@max_rows: #{@max_rows}, @max_cols: #{@max_cols}"
  end

  def update_till_steady
    loop do
      changed = update_seat_state
      if !changed
        break
      end
    end
  end

  def num_all_occupied
    cnt = 0
    @layout.each do |row|
      row.each do |col|
        if col == OCCUPIED
          cnt += 1
        end
      end
    end
    cnt
  end

  # If a seat is empty (L) and there are no occupied seats adjacent to it, the seat becomes occupied.
  # If a seat is occupied (#) and four or more seats adjacent to it are also occupied, the seat becomes empty.
  # Otherwise, the seat's state does not change.
  def update_seat_state
    changed = false
    @layout.each_with_index do |row, i|
      row.each_with_index do |col, j|
        num_occ = num_occupied_adjacent(i, j)
        case col
        when EMPTY
          if num_occ == 0
            col = OCCUPIED
            changed = true
          end
        when OCCUPIED
          if num_occ >= 4
            col = EMPTY
            changed = true
          end
        end
      end
    end
    changed
  end

  def num_occupied_adjacent(row_index, col_index)
    cnt = 0
    (row_index - 1..row_index + 1).each do |i|
      if i < 0 || i >= @max_rows
        next
      end
      (col_index - 1..col_index + 1).each do |j|
        if j < 0 || j >= @max_cols
          next
        end
        if layout[i][j] == OCCUPIED
          cnt += 1
        end
      end
    end
    cnt
  end
end
