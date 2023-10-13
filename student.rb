require_relative 'person'

class Student < Person
  attr_reader :classrom

  def initialize(age, classroom, _parent_permission, name)
    super(age, name, parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    puts '¯(ツ)/¯'
  end

  def add_student_to_class_room(classrom)
    @classrom = classrom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
