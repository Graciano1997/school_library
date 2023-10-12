require_relative 'nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = rand(1..1001)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end
  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    if of_age? || @parent_permission
      true
    else
      false
    end
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    rental = Rental.new(date, book, self)
    @rentals.push(rental) unless @rentals.include?(rental)
  end

  private

  def of_age?
    @age >= 18
  end
end
