require_relative 'app'

class Main
  def exit
    puts 'Thank you for using this App!'
  end

  def menu
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    operation = gets.chomp
    app = App.new
    case operation
    when 1
      app.list_all_book
    when 2
      app.list_all_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_all_rentals
    when 7
      self.exit
    else
      puts 'Please Ensure to choose from (1..7) according our menu list'
    end
  end

  def main; end
end
