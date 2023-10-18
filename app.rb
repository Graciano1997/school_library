require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'validateperson'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  MENU_OPTION = {
    '1' => :list_all_book,
    '2' => :list_all_people,
    '3' => :create_person,
    '4' => :create_book,
    '5' => :create_rental,
    '6' => :list_all_rentals,
    '7' => :quit
  }.freeze

  def call(option)
    send(MENU_OPTION[option.to_s])
  end

  def list_all_book()
    puts ' '
    puts '_________________ALL BOOKS 📔📘📖 _________________________'
    if @books.empty?
      puts 'Your library is Empty 😭'
      puts 'But you can Add some Lovely Books 🥰'
    else
      @books.each do |bookitem|
        puts "📖📘 Title: \"#{bookitem.title}\" Author: #{bookitem.author}"
      end
    end
    puts '__________________________________________'
  end

  def list_all_people()
    puts ' '
    puts '_________________ALL PEOPLE 👨👨 _________________________'
    if @people.empty?
      puts 'There is no people yet in your Library 😭'
      puts 'But you can Add some Lovely Persons 🥰'
    else
      @people.each do |person|
        category = if person.respond_to?(:specialization)
                     'Teacher'
                   else
                     'Student'
                   end
        puts "👨 [#{category}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
      end
    end
    puts '__________________________________________'
  end

  def create_person
    puts ' '
    puts '_________________CREATING A PERSON 👨👨 _________________________'
    puts 'Do you want to create a Teacher(1️⃣  ) or a Student(2️⃣  ) ?'
    person_option = gets.chomp.to_i
    factory_person = ValidatePerson.new(person_option)
    @people << factory_person.person
    puts 'Person Created Successfully 👨🤩'

    puts '__________________________________________'
  end

  def create_book
    puts ' '
    puts '_________________CREATING A BOOK 📔📘📖 _________________________'
    puts 'Title :'
    title = gets.chomp
    puts 'Author : 👨'
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book Created Successfully 📖📘'
    puts '__________________________________________'
  end

  def create_rental
    puts ' '
    puts '_________________RENTING A BOOK 👨💳 _________________________'
    puts 'Select a book 📖 from the following list by number'
    @books.each do |bookitem|
      puts "#{@books.index(bookitem)}) Title: #{bookitem.title}  Author: #{bookitem.author} 📖📘"
    end
    book_number = gets.chomp.to_i
    puts 'Select a person 👨 from the following list by number (not id)'
    @people.each do |person|
      category = if person.respond_to?(:specialization)
                   'Teacher'
                 else
                   'Student'
                 end
      puts "#{@people.index(person)}) [#{category}] Name: #{person.name}, ID: #{person.id} Age: #{person.age} 👨"
    end
    person_number = gets.chomp.to_i
    puts 'Date:  eg:2023/04/07 📅📅'
    date_of_rent = gets.chomp
    rent = Rental.new(date_of_rent, @books[book_number], @people[person_number])
    @rentals << rent unless @rentals.include?(rent)
    puts 'Rental created successfully 👨💳'
    puts '__________________________________________'
  end

  def list_all_rentals()
    puts ' '
    puts '_________________ALL THE RENTALS FOR A SPECIFIC PERSON 👨💳 _________________________'
    puts ' '
    puts ' 🆔 of Person: 👨'
    person_id = gets.chomp.to_i

    @rentals.each do |rent|
      puts "📅 Date: #{rent.date} 📖 Book: #{rent.book.title} by #{rent.book.author} 👨" if rent.person.id == person_id
      puts 'No Rental data was found for this 🆔' if rent.person.id != person_id
    end
    puts '__________________________________________'
  end

  def quit
    puts ' '
    puts 'Thank you for using this App! 🙏🙏'
    puts ' '
    puts 'I hope you enjoy this App! 😍🤩🥳'
    puts ' '
    puts 'Please 🌟🌟💫✨ on Github'
    puts ' '
  end
end
