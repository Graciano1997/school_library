class Book
  attr_accessor :title, :book, :rentals, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
  # def add_student_to_class_room(student)
  #   student.classroom = self
  #   @students.push(student)
  # end
  #  def rent_rental(date, person)
  #   person.book=self
  #    rental = Rental.new(date, self, person)
  #    self.rentals.push(rental) unless @rentals.include?(rental)
  #  end
end
