require_relative "student"
require_relative "teacher"
class App
  @people=[]
  @books=[]

def list_all_book
  @books.each do |book|
    puts "Title: #{book.title}, Author: #{book.author}"
  end
end

def list_all_people
  @people.each do |person,i|
    category= person.specialization? "Teacher" : "Student"
    puts "#{i}) [#{category}] Name: #{person.name}, ID: #{person.ID} Age: #{person.age}"
  end
end

def list_all_rentals(person_id)
end

def create_person
  puts "Do you want to create a Teacher(1) or a Student(2) ?"
  person=gets.chomp
  case person
  when 1
    puts "Name :"
    name=gets.chomp
    name=="Unknown" unless name!=""
    puts "Age :"
    age=gets.chomp
    puts "Specialization :"
    specialization=gets.chomp
    parent_permission=true
    teacher=Teacher.new(age, specialization, name,parent_permission)
    people << teacher
    puts "Person Created Successfully"
  when 2
    puts "Name :"
    name=gets.chomp
    name=="Unknown" unless name!=""
    puts "Age :"
    age=gets.chomp
    puts "ClassRoom :"
    classroom=gets.chomp
    puts "Permission (Y/N) :"
    permission=gets.chomp
    case permission
      when "N" || "n"
    parent_permission=false
      when "Y" || "y"
    parent_permission=true
    puts "Person Created Successfully"
      else
        puts "Please Ensure to type (Y or N) || (y or n)"
      end
    student=Student.new(age, classroom, name, parent_permission)
    @people << student
  else
    puts "Please Enrure to choose 1 to Create a Teacher or 2 to a student"
  end
end

def create_rental

end

def create_book
  puts "Title :"
  title=gets.chomp
  puts "Author :"
  author=gets.chomp
  book=Book.new(title, author)
  @books << book
  puts "Book Created Successfully"
end

end