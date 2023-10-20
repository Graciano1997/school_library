require_relative '../module/book'
require_relative '../module/teacher'

describe Book do
  context 'When testing the Book class methods' do
    it 'Should respond true to :title, :book, :rentals, :author methods' do
      title = 'Ruby'
      author = 'Yukihiro Matsumoto'
      book_item = Book.new(title, author)
      expect(book_item).to respond_to(:title)
      expect(book_item).to respond_to(:author)
      expect(book_item).to respond_to(:rentals)
      expect(book_item).to respond_to(:book)
    end
    it "Should match the book author's name {Yukihiro} before use set method and also yukihiro matsumoto after set a full name}" do
      title = 'Ruby'
      author = 'Yukihiro'
      book_item = Book.new(title, author)
      expect(book_item.author).to match(/yukihiro/i)
      full_name = "#{book_item.author} Matsumoto"
      book_item.author = full_name
      expect(book_item.author).to match(/Yukihiro Matsumoto/i)
    end

    it 'Should match the book title name {ruby / Ruby ...} before use set method and also A box full of rubies after set}' do
      title = 'Ruby'
      author = 'Yukihiro'
      book_item = Book.new(title, author)
      expect(book_item.title).to match(/RubY/i)
      new_title = 'A BOX FULL OF RUBIES'
      book_item.title = new_title
      expect(book_item.title).to match(/a box full of rubies/i)
    end

    it 'Should contain a rental array with zero element' do
      title = 'Ruby'
      author = 'Yukihiro'
      book_item = Book.new(title, author)
      book_item_rentals = book_item.rentals.size
      expect(book_item_rentals).to be 0
    end

    #  it "Should contain a rental array with 1 element" do
    #    title="Ruby"
    #    author="Yukihiro"
    #    book_item = Book.new(title,author)
    #    person_id=nil
    #    person_age=26
    #    person_specialization="Software Development"
    #    person_name="Graciano Henrique"
    #    person_object=Teacher.new(person_id, person_age, person_specialization, person_name)
    #    date_today=Time.now
    #    book_item.rent_rental(date_today.to_s,person_object)
    #    expect(book_item_rentals).to be 1
    #  end
    it '(book) should be an instance of Book class' do
      title = 'GOT'
      author = 'George Martin'
      book_item = Book.new(title, author)
      expect(book_item).to be_instance_of Book
    end

    it '(book.title) should equal GOT' do
      title = 'GOT'
      author = 'George Martin'
      book_item = Book.new(title, author)
      expect(book_item.title).to eql 'GOT'
    end

    it '(book.author) should equal George Martin' do
      title = 'GOT'
      author = 'George Martin'
      book_item = Book.new(title, author)
      expect(book_item.author).to eql 'George Martin'
    end
  end

  context 'Nil book title or author' do
    it '(book.title) should be nil' do
      title = nil
      author = 'George Martin'
      book_item = Book.new(title, author)
      expect(book_item.title).to be nil
    end

    it '(book.author) should be nil' do
      title = 'GOT'
      author = nil
      book_item = Book.new(title, author)
      expect(book_item.author).to be nil
    end
  end
end
