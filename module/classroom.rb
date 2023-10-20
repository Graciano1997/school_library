class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student_to_class_room(student)
    student.classroom = self
    @students.push(student)
  end
end
