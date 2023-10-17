require_relative 'rental'

class RentalController
  def create_rental(storage)
    puts ' '
    puts '_________________RENTING A BOOK 👨💳 _________________________'
    puts 'Select a book 📖 from the following list by number'
    storage.books.each do |bookitem|
      puts "#{storage.books.index(bookitem)}) Title: #{bookitem.title}  Author: #{bookitem.author} 📖📘"
    end
    book_number = gets.chomp.to_i
    puts 'Select a person 👨 from the following list by number (not id)'
    storage.people.each do |person|
      category = if person.respond_to?(:specialization)
                   'Teacher'
                 else
                   'Student'
                 end
      puts "#{storage.people.index(person)}) [#{category}] Name: #{person.name}, ID: #{person.id} Age: #{person.age} 👨"
    end
    person_number = gets.chomp.to_i
    puts 'Date:  eg:2023/04/07 📅📅'
    date_of_rent = gets.chomp
    rent = Rental.new(date_of_rent, @books[book_number], @people[person_number])
    storage.rentals << rent unless storage.rentals.include?(rent)
    puts 'Rental created successfully 👨💳'
    puts '__________________________________________'
  end

  def list_all_rentals(storage)
    puts ' '
    puts '_________________ALL THE RENTALS FOR A SPECIFIC PERSON 👨💳 _________________________'
    puts ' '
    puts ' 🆔 of Person: 👨'
    person_id = gets.chomp.to_i

    storage.each do |rent|
      puts "📅 Date: #{rent.date} 📖 Book: #{rent.book.title} by #{rent.book.author} 👨" if rent.person.id == person_id
      puts 'No Rental data was found for this 🆔' if rent.person.id != person_id
    end
    puts '__________________________________________'
  end
end
