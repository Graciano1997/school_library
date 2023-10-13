class Book
  attr_accessor :title, :book, :rentals, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rent_rental(date, person)
    rental = Rental.new(date, self, person)
    @rentals.push(rental) unless @rentals.include?(rental)
  end
end
