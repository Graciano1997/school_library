require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'

class App
  MENU_OPTION = {
    '1' => :list_all_book,
    '2' => :list_all_people,
    '3' => :create_person,
    '4' => :create_book,
    '5' => :create_rental,
    '6' => :list_all_rentals,
    '7' => :quit
  }.freeze

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def start_library
    description
    operat = gets.chomp
    MENU_OPTION.key?(operat) ? send(MENU_OPTION[operat]) : start_library
  end

  def description
    puts '************ THE AWESOME SCHOOL LIBRARY 📚📚 **************'
    puts ' '
    puts '1️⃣  - List all books 📔📘📖'
    puts '2️⃣  - List all people 👨👨'
    puts '3️⃣  - Create a person 👨'
    puts '4️⃣  - Create a book 📖'
    puts '5️⃣  - Create a rental 💳'
    puts '6️⃣  - List all rentals for a given person id 👨💳'
    puts '7️⃣  - Exit 🚪👐'
    puts ' '
    print '  Please enter a number  1️⃣  to 7️⃣  :'
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
    start_library
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
    start_library
  end

  def create_person
    puts ' '
    puts '_________________CREATING A PERSON 👨👨 _________________________'
    puts 'Do you want to create a Teacher(1️⃣  ) or a Student(2️⃣  ) ?'
    person = gets.chomp.to_i
    if person == 1
      puts 'Name :'
      name = gets.chomp
      puts 'Age :'
      age = gets.chomp
      puts 'Specialization :'
      specialization = gets.chomp
      teacher = Teacher.new(age, specialization, name)
      @people << teacher
      puts 'Person Created Successfully 👨🤩'
      puts '__________________________________________'
      start_library
    elsif person == 2
      puts 'Name :'
      name = gets.chomp
      puts 'Age :'
      age = gets.chomp
      puts 'ClassRoom :'
      classroom = gets.chomp
      puts 'Permission (Y/N) :'
      permission = gets.chomp.capitalize
      parent_permission = permission == 'Y'
      student = Student.new(age, classroom, parent_permission, name)
      @people << student
      puts 'Person Created Successfully 👨🤩'
      puts '__________________________________________'
      start_library
    else
      puts 'Please Enrure to choose Teacher(1️⃣  ) or a Student(2️⃣  )'
    end
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
    start_library
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

    start_library
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
    start_library
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
