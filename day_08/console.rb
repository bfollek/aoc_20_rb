class Console

  attr_reader :acc

  def initialize(program)
    load_code(program)
  end

  def run
    @acc = 0
  end

# -------------------------------------------------------------------
  private
# -------------------------------------------------------------------

  def load_code
    @code = Hash.new(false) # instruction => ran?
  end

end
