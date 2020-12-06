class Day06

  # part_1: 6748
  def part_1(file_name)
    forms = []
    h = {}
    File.foreach(file_name) do |line|
      line = line.strip
      if line == ''
        forms << h
        h = {}
      else
        answers = line.split('')
        answers.each { |a| h[a] = true }
      end
    end
      # Don't forget the form in progress when we hit EOF
    forms << h
    forms.sum { |h| h.size }
  end

end