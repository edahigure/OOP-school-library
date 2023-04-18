require './teacher'

pers = Teacher.new( 'juan', '16', 'math')
puts pers.can_use_services?
