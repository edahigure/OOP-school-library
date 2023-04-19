require './nameable'
class Decorator < Nameable
  def initialize(nameable)
    @nameable = nameable
    super()
  end

  # The Decorator delegates all work to the wrapped component.
  def correct_name
    @nameable.correct_name
  end
end
