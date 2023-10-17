require_relative 'student'
require_relative 'teacher'

class ValidatePerson
  attr_reader :person
  def initialize(option)
    puts 'Name :'
    @name = gets.chomp
    puts 'Age :'
    @age = gets.chomp
    if option.to_i == 1
      @person = create_teacher
    end
    return unless option.to_i == 2
    @person = create_student
  end

  def create_teacher
    puts 'Specialization :'
    @specialization = gets.chomp
    teacher=Teacher.new(@age, @specialization, @name)
    teacher
  end

  def create_student
    puts 'ClassRoom :'
    @classroom = gets.chomp
    puts 'Permission (Y/N) :'
    permission = gets.chomp.capitalize
    @parent_permission = permission
    student=Student.new(@age, @classroom, @parent_permission, @name)
    student
  end
end
