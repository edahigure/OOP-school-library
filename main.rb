require './teacher'

pers = Teacher.new(1,'juan', '16', 'math')
puts pers.can_use_services?
