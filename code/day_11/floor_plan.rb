class FloorPlan
  attr_reader :layout

  def initialize(file_name)
    @layout = []
    File.foreach(file_name) do |line|
      @layout << line.chomp.split("")
    end
  end
end
