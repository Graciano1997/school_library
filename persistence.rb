require 'json'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class Persistence
  attr_reader :people, :books, :rentals

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
