class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(id, name, age = 'unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    return true if of_age? || @parent_permission == true

    false
  end

  private

  def of_age?
    return true if @age != 'unknown' && @age.to_i >= 18

    false
  end
end
