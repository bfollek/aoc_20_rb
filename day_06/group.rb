class Group

  attr_accessor :answers, :num_members

  def initialize
    @answers = Hash.new(0)
    @num_members = 0
  end

  def self.load_from_file(file_name)
    groups = []
    g = self.new
    File.foreach(file_name) do |line|
      line = line.strip
      if line == ''
        groups << g
        g = self.new
      else
        g.num_members += 1
        answers = line.split('')
        answers.each { |a| g.answers[a] += 1 }
      end
    end
    # Don't forget the group in progress when we hit EOF
    groups << g
  end

end