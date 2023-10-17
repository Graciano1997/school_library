class Storage
  attr_accessor :books, :people, :rentals
  def initialize
    @people = []
    @books = []
    @rentals = []
  end
end
