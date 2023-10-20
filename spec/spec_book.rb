require_relative('../book')
require_relative('../student')
describe Book do
    context 'Correct expected (string) book title and author' do
        it '(book) should be an instance of Book class' do
            book = Book.new('GOT', 'George Martin')
            expect(book).to be_instance_of Book
        end

        it '(book.title) should equal GOT' do
            book = Book.new('GOT', 'George Martin')
            expect(book.title).to eql 'GOT'
        end

        it '(book.author) should equal George Martin' do
            book = Book.new('GOT', 'George Martin')
            expect(book.author).to eql 'George Martin'
        end
    end
    context 'Nil book title or author' do
        it '(book.title) should be nil' do
            book = Book.new(nil, 'George Martin')
            expect(book.title).to be nil
        end

        it '(book.author) should be nil' do
            book = Book.new('GOT', nil)
            expect(book.author).to be nil
        end
        # it '(book.rentals[0].person.name) should be Lily' do
        #     book = Book.new('GOT', 'George Martin')
        #     student = Student.new(23, 'D2', true, 'Lily')
        #     book.rent_rental('23/10/2023', student)
        #     expect(book.rentals[3].person.name).to eql 'Lily'
        # end
    end
end