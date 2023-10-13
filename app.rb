require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'

class App
  @people = []
  @books = []
  @rentals = []

  def list_all_book(showindex: false)
    @books.each do |book|
      if showindex == false
        puts "Title: #{book.title}, Author: #{book.author}"
      else
        puts "#{@books.index(book)}) Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_all_people(showindex: false)
    @people.each do |person|
      category = person.specialization ? 'Teacher' : 'Student'
      if showindex == false
        puts "[#{category}] Name: #{person.name}, ID: #{person.ID} Age: #{person.age}"
      else
        puts "#{people.index(person)}) [#{category}] Name: #{person.name}, ID: #{person.ID} Age: #{person.age}"
      end
    end
  end

  def create_person
    puts 'Do you want to create a Teacher(1) or a Student(2) ?'
    person = gets.chomp
    if person == 1
      puts 'Name :'
      name = gets.chomp
      name == 'Unknown' unless name != ''
      puts 'Age :'
      age = gets.chomp
      puts 'Specialization :'
      specialization = gets.chomp
      teacher = Teacher.new(age, specialization, name, true)
      people << teacher
      puts 'Person Created Successfully'
    elsif person == 2
      puts 'Name :'
      name = gets.chomp
      name == 'Unknown' unless name != ''
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
    else
      puts 'Please Enrure to choose 1 to Create a Teacher or 2 to a student'
    end
  end

  def create_book
    puts 'Title :'
    title = gets.chomp
    puts 'Author :'
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book Created Successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_all_book(true)
    book_number = gets.chomp
    puts 'Select a person from the following list by number (not id)'
    list_all_people(true)
    person_number = gets.chomp
    puts 'Date:  eg:2023/04/07'
    date_of_rent = gets.chomp
    rent = Rental.new(date_of_rent, @books[book_number], @people[person_number])
    @rentals << rent unless @rentals.include? rent
  end

  def list_all_rentals(person_id)
    puts "ID of Person: #{person_id}"
    @rentals.each do |rent|
      puts "Date: #{rent.date} Book: #{rent.book.title} by #{rent.book.author}"
    end
  end
end
