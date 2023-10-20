require_relative '../module/student'
require_relative '../module/classroom'

describe Student do
  context 'When testing the Student class and its methods' do
    it 'Should respond true to :label :students' do
      classrom_label = 'A1'
      classroom_item = Classroom.new(classrom_label)
      expect(classroom_item).to respond_to(:label)
      expect(classroom_item).to respond_to(:students)
    end

    it 'Should not have any student in the class' do
      classrom_label = 'A1'
      classroom_item = Classroom.new(classrom_label)
      is_empty_class_room = classroom_item.students.empty?
      expect(is_empty_class_room).to be_truthy
    end

    it 'Should not be and  an Empty classroom' do
      classroom_label = 'A1'
      classroom_item = Classroom.new(classroom_label)
      classroom_item.students.empty?
      person_id = nil
      person_age = 55
      person_classroom = 'A1'
      person_name = 'Madara'
      person_parent_permission = 'Y'
      person_object = Student.new(person_id, person_age, person_classroom, person_name, person_parent_permission)
      classroom_item.add_student_to_class_room(person_object)
      class_room_students = classroom_item.students.size
      expect(class_room_students).to equal 1
    end
    it '(classroom) should be an instance of Classroom class' do
      label = 'Room 2'
      classroom = Classroom.new(label)
      expect(classroom).to be_instance_of Classroom
    end

    it '(classroom.label) should equal Room 2' do
      label = 'Room 2'
      classroom = Classroom.new(label)
      expect(classroom.label).to eql 'Room 2'
    end
  end

  context 'Unexpected label' do
    it '(label) should be nil if given label is nil' do
      label = nil
      classroom = Classroom.new(label)
      expect(classroom.label).to be nil
    end
    it '(label) should be zero if given label is zero' do
      label = 0
      classroom = Classroom.new(label)
      expect(classroom.label).to be 0
    end
  end
end
