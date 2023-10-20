require_relative 'student'
require_relative 'teacher'

class ValidatePerson
  attr_reader :person

  def initialize(option)
    puts 'Name :'
    @name = gets.chomp
    puts 'Age :'
    @age = gets.chomp
    @person = create_teacher if option.to_i == 1
    return unless option.to_i == 2

    @person = create_student
  end

  def create_teacher
    puts 'Specialization :'
    @specialization = gets.chomp
    Teacher.new(nil, @age, @specialization, @name)
  end

  def create_student
    puts 'ClassRoom :'
    @classroom = gets.chomp
    puts 'Permission (Y/N) :'
    permission = gets.chomp.capitalize
    @parent_permission = permission
    Student.new(nil, @age, @classroom, @name, @parent_permission)
  end
end
