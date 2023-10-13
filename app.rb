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

  def startLibrary
    description
     operat = gets.chomp
    send(MENU_OPTION[operat])
  end

  def description
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def list_all_book(showindex: false)
    @books.each do |bookitem|
       if showindex == false
         puts "Title: \"#{bookitem.title}\" Author: #{bookitem.author}"
       else
         puts "#{@books.index(book)}) Title: #{book.title}  Author: #{book.author}"
       end
    end
    startLibrary
  end

  def list_all_people(showindex: false)
    @people.each do |person|
      if person.respond_to?(:specialization)
        category = 'Teacher'
      else
        category = 'Student'
      end
      if showindex == false
        puts "[#{category}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
      else
        puts "#{@people.index(person)}) [#{category}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
      end
    end
    startLibrary
  end

  def create_person
    puts 'Do you want to create a Teacher(1) or a Student(2) ?'
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
      puts 'Person Created Successfully'
      startLibrary
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
      puts 'Person Created Successfully'
      student = Student.new(age, classroom, name, parent_permission)
      @people << student
      startLibrary
    else
      puts 'Please Enrure to choose 1 to Create a Teacher or 2 to a student'
    end
  end

  def create_book
    puts 'Title :'
    title = gets.chomp
    puts 'Author :'
    author = gets.chomp
    book=Book.new(title, author)
    @books << book
    puts 'Book Created Successfully'
    startLibrary
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each do |bookitem|
        puts "#{@books.index(bookitem)}) Title: #{bookitem.title}  Author: #{bookitem.author}"
      end
    book_number = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @people.each do |person|
      if person.respond_to?(:specialization)
        category = 'Teacher'
      else
        category = 'Student'
      end
        puts "#{@people.index(person)}) [#{category}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
    person_number = gets.chomp.to_i
    puts 'Date:  eg:2023/04/07'
    date_of_rent = gets.chomp
    rent = Rental.new(date_of_rent, @books[book_number], @people[person_number])
    @rentals << rent unless @rentals.include? rent
    puts "Rental created successfully"
    startLibrary
  end

  def list_all_rentals()
    puts "ID of Person:"
    person_id=gets.chomp.to_i
    puts "Rentals"
    @rentals.each do |rent|
      puts "Date: #{rent.date} Book: #{rent.book.title} by #{rent.book.author} " if rent.person.id==person_id
    end
    startLibrary
  end

  def quit
    puts "Starting..."
    puts 'Thank you for using this App!'
  end
end
