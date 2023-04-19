# many-to-many (also has-many-through) relationship between Person and Book

class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rental << self

    @person = person
    person.rental << self
  end
end
