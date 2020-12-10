class Xmas

  def initialize(file_name, preamble_size)
    @nums = []
    File.foreach(file_name) { |line| @nums << line.chomp.to_i }
    @preamble_size = preamble_size
  end

  # "The first step of attacking the weakness in the XMAS data is to find the first number in the list (after
  # the preamble) which is not the sum of two of the 25 numbers before it. What is the first number that does not
  # have this property?"
  def invalid_num
    preamble_start = 0
    loop do
      target = @nums[preamble_start + @preamble_size]
      preamble = @nums[preamble_start, @preamble_size]
      found_target = false
      preamble.each do |x|
        preamble.each do |y|
          next if x == y
          if x + y == target
            found_target = true
            break
          end
        end
        break if found_target
      end
      return target if !found_target
      preamble_start += 1
    end
  end

  # "...you must find a contiguous set of at least two numbers in your list which sum to the invalid number
  # from step 1."
  # "To find the encryption weakness, add together the smallest and largest number in this contiguous range..."
  def encryption_weakness
    target = invalid_num
    total, start, i = start_sequence(0)
    finish = nil
    loop do
      nxt = @nums[i]
      # If the next number is the target, we're not using 2 numbers. Abandon the sequence.
      if nxt == target
        total, start, i = start_sequence(start)
        next
      end
      total += nxt
      # If we go over the target, abandon the sequence.
      if total > target
        total, start, i = start_sequence(start)
        next
      end
      # If the total is the target, we found the sequence.
      if total == target
        finish = i
        break
      end
      # If we get here, total < target, so loop and extend the sequence.
      i += 1
    end
    seq = @nums[start..finish]
    seq.min + seq.max
  end

# -------------------------------------------------------------------
  private
# -------------------------------------------------------------------

  def start_sequence(start)
    return 0, start + 1, start + 1
  end

end