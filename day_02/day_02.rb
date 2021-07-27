# typed: strict

require 'sorbet-runtime'

require_relative 'password_entry'

class Day02
  extend T::Sig

  sig {params(file_name: String).void}
  def initialize(file_name)
    @file_name = file_name
  end

  # How many passwords are valid according to their policies?
  sig {returns(Integer)}
  def part_1
    looper { |pe| pe.part_1_valid? }
  end

  sig {returns(Integer)}
  def part_2
    looper { |pe| pe.part_2_valid? }
  end

# -------------------------------------------------------------------
  private
# -------------------------------------------------------------------

  # The `blk` param is a Proc that takes a PasswordEntry param and returns a boolean.
  # The `looper` method returns an Integer.
  #
  # The `-a` autocorrect came up with this:
  #   sig {params(blk: T.untyped).returns(Integer)}
  #
  # The static tc does check the proc return type I provided. If I change it to `String`,
  # I get errors.
  sig {params(blk: T.proc.params(pe: PasswordEntry).returns(T::Boolean))
    .returns(Integer)}
  def looper(&blk)
    cnt = 0
    File.foreach(@file_name) do |line|
      pe = PasswordEntry.new line
      cnt += 1 if yield pe
    end
    cnt
  end

end
