require_relative 'app'

class Libraryui < App
  # MENU_OPTIONS = {
  #   '1' => list_all_book
  #   '2' => list_all_people,
  #   '3' => create_person,
  #   '4' => create_book,
  #   '5' => create_rental,
  #   '6' => list_all_rentals,
  #   '7' => exit
  # }.freeze

  def description
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def start
    puts "cheguei"
    description
    operation = gets.chomp
    MENU_OPTIONS[operation]
  end
end
