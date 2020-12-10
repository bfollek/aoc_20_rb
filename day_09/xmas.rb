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

end