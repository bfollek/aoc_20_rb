# typed: false
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
    # Starting from 1 covers the edge case where the target is the first num.
    # total will be > target as soon as we add the second num.
    start, i = 1, 1
    total = @nums[0]
    finish = nil
    loop do
      total += @nums[i]
      case
      # If we went over the target, restart the sequence from the next number.
      when total > target
        start, i, total = start + 1, start + 1, 0
        next
      # If the total is the target, we found the sequence.
      when total == target
        finish = i
        break
      else
      # If we get here, total < target, so loop and extend the sequence.
        i += 1
      end
    end
    seq = @nums[start..finish]
    seq.min + seq.max
  end

end