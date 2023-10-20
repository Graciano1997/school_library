require_relative('../student')
require_relative('../book')
require_relative('../rental')

describe Rental do
    context 'Correct date, book and student data types and format' do
        it '(rental) should be an instance of Rental class' do
            book = Book.new('GOT', 'George Martin')
            student = Student.new(23, 'D2', true, 'John')
            rental = Rental.new('23/10/2023', book, student)
            expect(rental).to be_instance_of Rental
        end
        it '(rental.person.name) should equal John' do
            book = Book.new('GOT', 'George Martin')
            student = Student.new(23, 'D2', true, 'John')
            rental = Rental.new('23/10/2023', book, student)
            expect(rental.person.name).to eql 'John'
        end

        it '(rental.book.author) should equal George Martin' do
            book = Book.new('GOT', 'George Martin')
            student = Student.new(23, 'D2', true, 'John')
            rental = Rental.new('23/10/2023', book, student)
            expect(rental.book.author).to eql 'George Martin'
        end
    end
    context 'nil date, book or author' do
        it '(rental) should raise an NoMethodError exception if date is nil' do
            student = Student.new(23, 'D2', true, 'John')
            book = Book.new('GOT', 'George Martin')
            rental = Rental.new(nil, book, student)
            expect(rental.date).to be nil
        end
        it '(rental) should raise an NoMethodError exception if book is nil' do
            student = Student.new(23, 'D2', true, 'John')
            expect{Rental.new('23/10/2023', nil, student)}.to raise_error(NoMethodError)
        end

        it '(rental) should raise an NoMethodError exception if student is nil' do
            book = Book.new('GOT', 'George Martin')
            expect{Rental.new('23/10/2023', book, nil)}.to raise_error(NoMethodError)
        end
        it '(rental) should raise an NoMethodError exception if both book and student are nil' do
            expect{Rental.new('23/10/2023', nil, nil)}.to raise_error(NoMethodError)
        end
    end

        # it '(book.author) should equal George Martin' do
        #     book = Book.new('GOT', 'George Martin')
        #     expect(book.author).to eql 'George Martin'
        # end
    #end
end