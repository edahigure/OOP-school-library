class Nameable
  def initialize(name = 'unknown')
    @name = name
  end

  def correct_name
    raise NotImplementedError
  end
end
