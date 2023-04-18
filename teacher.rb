require './person'

class Teacher < Person
  def initialize(name, specialization, age = 'unknown')
    @specialization = specialization
    super(age, name)
  end

  def can_use_services?
    true
  end
end
