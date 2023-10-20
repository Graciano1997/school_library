class UserInterface
  attr_reader :option

  def show()
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
    @option = gets.chomp.to_i
  end
end
