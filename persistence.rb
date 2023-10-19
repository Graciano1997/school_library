require 'json'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class Persistence
  attr_reader :people, :books, :rentals

  def initialize
    unless Dir.exist?('db')
      Dir.mkdir('db')
      Dir.chdir('./db')
      `touch rentals.json`
      `touch books.json`
      `touch people.json`
      Dir.chdir('../')
    end
    @people = read_people || []
    @books = read_books || []
    @rentals = read_rentals || []
  end

def read_books
    unless File.empty?('./db/books.json')
      book_base = JSON.parse(File.read('./db/books.json'))
      books = []
      book_base.each do |book|
        book_item = Book.new(book['title'], book['author'])
        books << book_item
      end
    end
    @books = books
  end

def read_people
    return if File.empty?('./db/people.json')
    people_base = JSON.parse(File.read('./db/people.json'))
    people = []
    people_base.each do |person|
      person_item = if person['specialization']
      Teacher.new(person['id'], person['age'], person['specialization'], person['name'])
    else
      Student.new(person['id'], person['age'], person['classroom'], person['name'],
      person['parent_permission'])
    end
    people << person_item
    end
    @people = people
  end
  
  def get_book(title)
    book_item = []
    @books.each do |book|
      if book.title == title
        book_item = { 'title' => book.title, 'author' => book.author }
        break
      end
    end
    book_item
  end

  def get_person(id)
    person_item = []
    @people.each do |person|
      next unless person.id == id

      person_item = if person.respond_to?(:specialization)
                      { 'id' => person.id,
                        'age' => person.age, 'specialization' => person.specialization,
                        'name' => person.name }
                    else
                      { 'id' => person.id, 'age' => person.age,
                        'classroom' => person.classroom,
                        'name' => person.name,
                        'parent_permission' => person.parent_permission }
                    end
      break
    end
    person_item
  end


  def rentals_hashed(rentals)
    rental_objects = []
    rentals.each do |rental|
      rental_hash = {}
      rental_hash['person_id'] = rental.person.id
      rental_hash['book_title'] = rental.book.title
      rental_hash['date'] = rental.date
      rental_objects << rental_hash
    end
    rental_objects
  end

  def book_hashed(books)
    book_objects = []
    books.each do |book|
      book_hash = {}
      book_hash['author'] = book.author
      book_hash['title'] = book.title
      book_objects << book_hash
    end
    book_objects
  end

  def people_hashed(people)
    people_objects = []
    people.each do |person|
      person_hash = {}
      person_hash['id'] = person.id
      person_hash['name'] = person.name
      person_hash['age'] = person.age
      if person.respond_to?(:specialization)
        person_hash['specialization'] = person.specialization
      else
        person_hash['classroom'] = person.classroom
        person_hash['parent_permission'] = person.parent_permission
      end
      people_objects << person_hash
    end
    people_objects
  end

  def save_all(books, rentals, people)
    puts ' '
    puts '_________________Persisting all the data 📚📂🌐 before exit .... _________________________'
    puts ' '
    File.write('./db/books.json', JSON.pretty_generate(book_hashed(books)), mode: 'w')
    puts '***Saving all 📚📚 ...'
    File.write('./db/people.json', JSON.pretty_generate(people_hashed(people)), mode: 'w')
    puts '***Saving all people 👨👨 ...'
    File.write('./db/rentals.json', JSON.pretty_generate(rentals_hashed(rentals)), mode: 'w')
    puts '***Saving all rentals 👨💳 ...'
    puts ' '
    puts '________________________Saved 100% successfully ✅✅___________________________________________'
  end
end
