require_relative 'instruction'

class Console

  def initialize(program)
    load_code(program)
  end

  # Return [true|false, acc] - true if the program terminated normally,
  # false if there was a loop and we killed it.
  def run
    # Track which instructions run.
    has_run = Array.new(@instructions.size, false)
    acc = 0
    pc = 0 # Program Counter
    while pc < @instructions.size
      if has_run[pc]
        # Loop - kill it
        return [false, acc]
      else
        has_run[pc] = true
      end
      i = @instructions[pc]
      case i.code
      when Instruction::NO_OP
        pc += 1
      when Instruction::ACCUMULATE
        pc += 1
        acc += i.arg
      when Instruction::JUMP
        pc += i.arg
      else
        raise "Unknown instruction: #{i}"
      end
    end
    [true, acc]
  end

  def swap_codes_and_run(code_1, code_2)
  end

# -------------------------------------------------------------------
  private
# -------------------------------------------------------------------

  def load_code(program)
    @instructions = []
    File.foreach(program) do |cmd|
      i = Instruction.new(cmd.chomp)
      @instructions << i
    end
  end

end
