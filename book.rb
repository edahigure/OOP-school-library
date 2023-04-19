class Book
  attr_accessor :title, :author

  att_reader :rentals
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
end
