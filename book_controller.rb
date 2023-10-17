require_relative 'book'

class BookController
  def list_all_book(storage)
    puts ' '
    puts '_________________ALL BOOKS 📔📘📖 _________________________'
    if storage.empty?
      puts 'Your library is Empty 😭'
      puts 'But you can Add some Lovely Books 🥰'
    else
      storage.each do |bookitem|
        puts "📖📘 Title: \"#{bookitem.title}\" Author: #{bookitem.author}"
      end
    end
    puts '__________________________________________'
  end

  def create_book(storage)
    puts ' '
    puts '_________________CREATING A BOOK 📔📘📖 _________________________'
    puts 'Title :'
    title = gets.chomp
    puts 'Author : 👨'
    author = gets.chomp
    book = Book.new(title, author)
    storage << book
    puts 'Book Created Successfully 📖📘'
    puts '__________________________________________'
  end
end
