require './person'

class Student < Person
  def initialize(id, name, classroom, age = 'unknown', parent_permission: true)
    @classroom = classroom
    super(id, name, age, parent_permission)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
