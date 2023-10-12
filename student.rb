require_relative 'person'

class Student < Person
  attr_reader: classrom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    puts '¯(ツ)/¯'
  end
  def add_student_to_class_room(classrom)
    @classrom = classrom
    classrom.add_student_to_class_room(self)
  end
end
