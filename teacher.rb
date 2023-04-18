require './person'

class Teacher < Person
  def initialize(_id, name, specialization, age = 'unknown')
    @specialization = specialization
    super(age, name)
  end

  def can_use_services?
    true
  end
end
