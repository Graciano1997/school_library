require_relative '../module/rental'
require_relative '../module/teacher'
require_relative '../module/student'
require_relative '../module/book'

describe Rental do
  context 'When testing the Rental class methods' do
    it 'Should respond true to :date, :book, :person methods' do
      title = 'Ruby'
      author = 'Yukihiro Matsumoto'
      book_item = Book.new(title, author)
      date = '2023/12/12'

      person_id = nil
      person_age = 18
      person_classroom = 'A1'
      person_name = 'Madara'
      person_parent_permission = 'Y'
      person_object = Student.new(person_id, person_age, person_classroom, person_name, person_parent_permission)

      rent_item = Rental.new(date, book_item, person_object)
      expect(rent_item).to respond_to(:date)
      expect(rent_item).to respond_to(:book)
      expect(rent_item).to respond_to(:person)
    end

    it 'Should get a Book object' do
      title = 'A Box Full Of Rubies'
      author = 'Yukihiro Matsumoto'
      book_item = Book.new(title, author)
      date = '2023/12/12'

      person_id = nil
      person_age = 18
      person_classroom = 'A1'
      person_name = 'Madara'
      person_parent_permission = 'Y'
      person_object = Student.new(person_id, person_age, person_classroom, person_name, person_parent_permission)

      rent_item = Rental.new(date, book_item, person_object)
      book_rented = rent_item.book
      book_rented_title = book_rented.title

      expect(book_rented).to be_instance_of Book
      expect(book_rented_title).to match(/A Box full of Rubies/i)
    end

    it 'Should get a Person object' do
      title = 'A Box Full Of Rubies'
      author = 'Yukihiro Matsumoto'
      book_item = Book.new(title, author)
      date = '2023/12/12'

      person_id = nil
      person_age = 18
      person_classroom = 'A1'
      person_name = 'Madara'
      person_parent_permission = 'Y'
      person_object = Student.new(person_id, person_age, person_classroom, person_name, person_parent_permission)

      rent_item = Rental.new(date, book_item, person_object)
      person_that_rented = rent_item.person
      person_that_rented_name = person_that_rented.name
      expect(person_that_rented).to be_instance_of Student
      expect(person_that_rented_name).not_to match(/Madara Uchia/i)
    end

    it '(rental) should be an instance of Rental class' do
      title = 'GOT'
      author = nil
      book_item = Book.new(title, author)
      date = '2023/10/13'
      student_id = nil
      student_age = 23
      student_classroom = 'D2'
      student_name = 'John'
      student_parent_permission = 'Y'
      student_object = Student.new(student_id, student_age, student_classroom, student_name, student_parent_permission)
      rental = Rental.new(date, book_item, student_object)
      expect(rental).to be_instance_of Rental
    end

    it '(rental.person.name) should equal John' do
      title = 'GOT'
      author = 'George Martin'
      book_item = Book.new(title, author)
      date = '2023/10/13'
      student_id = nil
      student_age = 23
      student_classroom = 'D2'
      student_name = 'John'
      student_parent_permission = 'Y'
      student_object = Student.new(student_id, student_age, student_classroom, student_name, student_parent_permission)
      rental = Rental.new(date, book_item, student_object)

      expect(rental.person.name).to eql 'John'
    end

    it '(rental.book.author) should equal George Martin' do
      title = 'GOT'
      author = 'George Martin'
      book_item = Book.new(title, author)
      date = '2023/10/13'
      student_id = nil
      student_age = 23
      student_classroom = 'D2'
      student_name = 'John'
      student_parent_permission = 'Y'
      student_object = Student.new(student_id, student_age, student_classroom, student_name,
                                   student_parent_permission)
      rental = Rental.new(date, book_item, student_object)
      expect(rental.book.author).to eql 'George Martin'
    end
  end

  context 'nil date, book or author' do
    it '(rental) should raise an NoMethodError exception if date is nil' do
      title = 'GOT'
      author = 'George Martin'
      book_item = Book.new(title, author)
      date = nil
      student_id = nil
      student_age = 23
      student_classroom = 'D2'
      student_name = 'John'
      student_parent_permission = 'Y'
      student_object = Student.new(student_id, student_age, student_classroom, student_name,
                                   student_parent_permission)
      rental = Rental.new(date, book_item, student_object)
      expect(rental.date).to be nil
    end
    it '(rental) should raise an NoMethodError exception if book is nil' do
      # title='GOT'
      #   author='George Martin'
      book_item = nil # Book.new(title, author)
      date = '2023/10/13'
      student_id = nil
      student_age = 23
      student_classroom = 'D2'
      student_name = 'John'
      student_parent_permission = 'Y'
      student_object = Student.new(student_id, student_age, student_classroom, student_name, student_parent_permission)
      expect { Rental.new(date, book_item, student_object) }.to raise_error(NoMethodError)
    end
    it '(rental) should raise an NoMethodError exception if student is nil' do
      title = 'GOT'
      author = 'George Martin'
      book_item = Book.new(title, author)
      date = '2023/10/13'
      student_object = nil
      expect { Rental.new(date, book_item, student_object) }.to raise_error(NoMethodError)
    end
    it '(rental) should raise an NoMethodError exception if both book and student are nil' do
      book_item = nil
      student_object = nil
      expect { Rental.new('23/10/2023', book_item, student_object) }.to raise_error(NoMethodError)
    end
  end
end
