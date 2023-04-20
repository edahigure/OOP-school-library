require './book.rb'
require './student.rb'
require './teacher.rb'
require './rental.rb'


class App
  attr_accessor :books, :people, :rentals
  def initialize 
    @books = []
    @people = []
    @rentals = []
  end


  def run
    puts 'Hello world'
  end

  def list_books
    @books.each { | book | puts "title: #{book.title}  author: #{book.author}"  }
  end

  def list_people 
    
    @people.each { | person | 
    if person.is_a?(Teacher)
      print  '[Teacher] '
    else 
      print  '[Student] '
    end

    puts  "Name: #{person.name} ID: #{person.id} age: #{person.age}"  
    }
  end

  def list_rentals (id)
    
    @rentals.each { |rental| 
      if rental.person.id==id
        puts  "date: #{rental.date}  book: #{rental.book.title} person: #{rental.person.name} id: #{rental.person.id}"  
      end
    }
  end

  def create_student (age, classroom, name, parent_permission)    
    @people.push(Student.new(age, classroom, name , parent_permission:parent_permission)) 
  end

  def create_teacher (age, specialization, name)
    @people.push(Teacher.new(age, specialization, name))
  end

  def create_book (title, author)
    @books.push(Book.new(title,author))
  end

  def create_rental (date, book, person)
    @rentals.push( Rental.new( date, book, person) )
  end

end
