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

  def part_1
    update_till_steady
    num_all_occupied
  end

  def dump
    puts "\n"
    @layout.each_with_index do |row, i|
      puts sprintf("%02d: %s", i + 1, row.join)
    end
    puts "\n"
  end

  def update_till_steady
    loop do
      changed = update_seat_state
      dump
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

  # The following rules are applied to every seat simultaneously:
  # If a seat is empty (L) and there are no occupied seats adjacent to it, the seat becomes occupied.
  # If a seat is occupied (#) and four or more seats adjacent to it are also occupied, the seat becomes empty.
  # Otherwise, the seat's state does not change.
  #
  # Because of the "simultaneously" requirement, we don't want to change the layout as we go. Instead,
  # we want to build a whole new layout, and replace it. In other words, we don't want earlier seat changes
  # to affect later seat changes. All seat changes should run against the original point-in-time layout.
  def update_seat_state
    changed = false
    new_layout = Array.new(@max_rows) { Array.new(@max_cols) }
    @layout.each_with_index do |row, i|
      row.each_with_index do |col, j|
        if col == EMPTY && num_occupied_adjacent(i, j) == 0
          new_layout[i][j] = OCCUPIED
          changed = true
        elsif col == OCCUPIED && num_occupied_adjacent(i, j) >= 4
          new_layout[i][j] = EMPTY
          changed = true
        else
          new_layout[i][j] = col
        end
      end
    end
    if changed
      @layout = new_layout
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
