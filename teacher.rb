require './person'

class Teacher < Person
  def initialize(id, name, specialization, age = 'unknown')
    @specialization = specialization
    super(id, name, age)
  end

  def can_use_services?
    true
  end
end
