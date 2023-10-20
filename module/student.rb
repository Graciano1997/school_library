require_relative 'person'

class Student < Person
  attr_accessor :classroom, :parent_permission, :name, :age, :id

  def initialize(id, age, classroom, name, parent_permission)
    super(id, age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    puts '¯(ツ)/¯'
  end

  def add_student_to_class_room(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
