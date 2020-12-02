# typed: strict

require 'sorbet-runtime'

class PasswordEntry
  extend T::Sig

  RE = /\A(?<min>\d+)-(?<max>\d+)\s+(?<required>\w):\s+(?<password>.*)\Z/

  sig {params(line: String).void}
  def initialize(line)
    matches = line.match(RE)
    if matches
      @min_count = T.let(matches[:min].to_i, Integer)
      @max_count = T.let(matches[:max].to_i, Integer)
      @required_char = T.let(matches[:required].to_s, String)
      @password = T.let(matches[:password].to_s, String)
    else
      raise "Couldn't parse #{line}"
    end
  end

  sig {returns(T::Boolean)}
  def part_1_valid?
    cnt = 0
    @password.each_char do |c|
      cnt += 1 if c == @required_char
      return false if cnt > @max_count
    end
    cnt >= @min_count
  end

  sig {returns(T::Boolean)}
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