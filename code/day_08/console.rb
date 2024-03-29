# typed: true
require_relative 'instruction'

class Console

  # Return [true|false, acc] - true if the program terminated normally,
  # false if there was a loop and we killed it.
  def run(instructions)
    # Track which instructions run.
    has_run = Array.new(instructions.size, false)
    acc = 0
    # Program counter.
    pc = 0
    while pc < instructions.size
      if has_run[pc]
        # Loop - kill it.
        return [false, acc]
      else
        has_run[pc] = true
      end
      i = instructions[pc]
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

  def swap_codes_and_run(instructions, code_1, code_2)
    insts = instructions.dup
    insts.each_with_index do |inst, i|
      save_code = inst.code
      if inst.code == code_1
        inst.code = code_2
      elsif inst.code == code_2
        inst.code = code_1
      end
      rv, acc = run(insts)
      if rv
        return acc
      else
        insts[i].code = save_code
      end
    end
  end

  def load_code(program)
    instructions = []
    File.foreach(program) do |cmd|
      i = Instruction.new(cmd.chomp)
      instructions << i
    end
    instructions
  end

# -------------------------------------------------------------------
  private
# -------------------------------------------------------------------



end
