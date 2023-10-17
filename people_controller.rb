require_relative 'validateperson'

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
    person_option = gets.chomp.to_i
    person=ValidatePerson.New(person_option)
    storage << person
    puts 'Person Created Successfully 👨🤩'
    puts '__________________________________________'
    end
  end
end
