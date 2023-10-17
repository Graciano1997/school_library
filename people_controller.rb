require_relative 'student'
require_relative 'teacher'

class PersonController
  def list_all_people(storage)
    puts ' '
    puts '_________________ALL PEOPLE 👨👨 _________________________'
    if storage.empty?
      puts 'There is no people yet in your Library 😭'
      puts 'But you can Add some Lovely Persons 🥰'
    else
      storage.each do |person|
        category = if person.respond_to?(:specialization)
                     'Teacher'
                   else
                     'Student'
                   end
        puts "👨 [#{category}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
      end
    end
    puts '__________________________________________'
  end

  def create_person(storage)
    puts ' '
    puts '_________________CREATING A PERSON 👨👨 _________________________'
    puts 'Do you want to create a Teacher(1️⃣  ) or a Student(2️⃣  ) ?'
    person = gets.chomp.to_i
    if person == 1
      puts 'Name :'
      name = gets.chomp
      puts 'Age :'
      age = gets.chomp
      puts 'Specialization :'
      specialization = gets.chomp
      teacher = Teacher.new(age, specialization, name)
      storage << teacher
      puts 'Person Created Successfully 👨🤩'
      puts '__________________________________________'
    elsif person == 2
      puts 'Name :'
      name = gets.chomp
      puts 'Age :'
      age = gets.chomp
      puts 'ClassRoom :'
      classroom = gets.chomp
      puts 'Permission (Y/N) :'
      permission = gets.chomp.capitalize
      parent_permission = permission == 'Y'
      student = Student.new(age, classroom, parent_permission, name)
      storage << student
      puts 'Person Created Successfully 👨🤩'
      puts '__________________________________________'
    else
      puts 'Please Enrure to choose Teacher(1️⃣  ) or a Student(2️⃣  )'
    end
  end
end
