require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals, :id, :parent_permission

  def initialize(id, age, name = 'Unknown', parent_permission: true)
    super()
    @id = id || rand(1..1001)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

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
    @age.to_i >= 18
  end
end
