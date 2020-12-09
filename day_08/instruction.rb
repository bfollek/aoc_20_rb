class Instruction

  ACCUMULATE = "acc"
  JUMP = "jmp"
  NO_OP = "nop"

  attr_accessor :code, :arg

  def initialize(s)
    @code, @arg = s.split(' ')
    @arg = @arg.to_i
  end

end