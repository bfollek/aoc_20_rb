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
    loop do
      if has_run[pc]
        # Loop - kill it
        return [false, acc]
      else
        has_run[pc] = true
      end
      i = @instructions[pc]
      case i.code
      when 'nop'
        pc += 1
      when 'acc'
        pc += 1
        acc += i.arg
      when 'jmp'
        pc += i.arg
      else
        raise "Unknown instruction: #{i}"
      end
    end
    [true, acc]
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
