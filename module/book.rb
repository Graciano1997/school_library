class Book
  attr_accessor :title, :book, :rentals, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
end
