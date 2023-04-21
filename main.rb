require './app'
def init(app)
  app.create_student('10', '1', 'juan', true)
  app.create_student('13', '1', 'jose', true)
  app.create_student('15', '1', 'pepe', false)

  app.create_teacher('30', 'math', 'Pedro')
  app.create_teacher('35', 'math', 'Pablo')
  app.create_teacher('40', 'math', 'Lalo')

  app.create_book('Lost Paridise', 'Milton')
  app.create_book('Pride and Prejudice ', 'Jane Austen')
  app.create_book('In Cold Blood', 'Truman Capote')
  app.list_people

  app.create_rental('2023/04/20', app.books[0], app.people[0])
  app.list_rentals(app.people[0].id)
end

def add_student(app)
  print 'Age:  '
  age = gets.chomp
  print 'Name:  '
  name = gets.chomp
  puts 'Has parent permission? [Y/N]: '
  ans_parent_permission = gets.chomp
  parent_permission = true if %w[Y y].include?(ans_parent_permission)
  parent_permission = false if %w[N n].include?(ans_parent_permission)
  app.create_student(age, '1', name, parent_permission)
  puts 'Person created successfully'
end

def create_a_person(app)
  puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
  ans_create_person = gets.chomp.to_i
  case ans_create_person
  when 1
    add_student(app)
  when 2
    print 'Age:  '
    age = gets.chomp
    print 'Name:  '
    name = gets.chomp
    print 'Specialization:  '
    specialization = gets.chomp
    app.create_teacher(age, specialization, name)
    puts 'Person created successfully'
  end
end

def create_a_rental(app)
  puts 'Seleect a book from the following list by number (not ID): '

  app.books.each_with_index do |book, idx|
    puts "#{idx}) Title: \"#{book.title}\" Author: #{book.author} "
  end

  idx_book = gets.chomp.to_i

  puts 'Seleect a person from the following list by number (not ID): '

  app.people.each_with_index do |person, idx|
    role = if person.is_a?(Teacher)
             'Teacher'
           else
             'Student'
           end

    puts "#{idx}) [#{role}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age} "
  end

  idx_person = gets.chomp.to_i

  print 'Date: '
  date = gets.chomp

  app.create_rental(date, app.books[idx_book], app.people[idx_person])
  puts 'Rental created successfully'
end

def print_menu
  puts 'Please choose an option by entering a number'
  puts '1.- List all books'
  puts '2.- List all people'
  puts '3.- Create a person'
  puts '4.- Create a book'
  puts '5.- Create a rental'
  puts '6.- List all rentals for a given person id'
  puts '7.- Exit'
  gets.chomp.to_i
end

def create_book(app)
  print 'Author: '
  author = gets.chomp
  print 'Title: '
  title = gets.chomp
  app.create_book(title, author)
  puts 'Book created successfully'
end

def make_four_cases(app, ans)
  case ans
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    create_a_person(app)
  when 4
    create_book(app)
  end
end

def loop(app)
  ans = 0
  while ans != 7
    ans = print_menu
    case ans
    when 1..4
      make_four_cases(app, ans)
    when 5
      create_a_rental(app)
    when 6
      print 'ID of person: '
      id = gets.chomp.to_i
      app.list_rentals(id)
    when 7
      puts 'Thank you for using this app'
    else
      puts "Error: (#{ans}) is not in the list"
    end
  end
end

def main
  app = App.new
  init(app)
  puts 'Welcome to School Library App!'
  loop(app)
end

main
