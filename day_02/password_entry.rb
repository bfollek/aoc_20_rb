class PasswordEntry

  RE = /\A(\d+)-(\d+)\s+(\w):\s+(.*)\Z/

  def initialize(line)
    matches = line.match(RE)
    if matches
      i, j, @required_char, @password = *matches[1..]
      @min_count = i.to_i
      @max_count = j.to_i
    else
      raise "Couldn't parse #{line}"
    end
  end

  def part_1_valid?
    cnt = 0
    @password.each_char do |c|
      cnt += 1 if c == @required_char
      return false if cnt > @max_count
    end
    cnt >= @min_count
  end

  def part_2_valid?
    match_1 = @password[@min_count - 1] == @required_char
    match_2 = @password[@max_count - 1] == @required_char
    case
    when match_1 && match_2
      false
    when match_1 || match_2
      true
    else
      false
    end
  end

end