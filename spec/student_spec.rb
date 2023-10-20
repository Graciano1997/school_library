require_relative '../module/student'


describe Student do
  context 'When testing the Student class and its methods' do
    it 'Should respond true to :classroom, :parent_permission, :name, :age, :id' do
      person_id = nil
      person_age = 18
      person_classroom = 'A1'
      person_name = 'Madara'
      person_parent_permission = 'Y'
      person_object = Student.new(person_id, person_age, person_classroom, person_name, person_parent_permission)
      expect(person_object).to respond_to(:id)
      expect(person_object).to respond_to(:name)
      expect(person_object).to respond_to(:classroom)
      expect(person_object).to respond_to(:parent_permission)
    end
    it "Should not match the person's name Madara Uchia" do
      person_id = nil
      person_age = 18
      person_classroom = 'A1'
      person_name = 'Madara'
      person_parent_permission = 'Y'
      person_object = Student.new(person_id, person_age, person_classroom, person_name, person_parent_permission)
      expect(person_object.name).not_to match(/Madara Uchia/i)
    end

    it "The person's age Should be in 40..60 years " do
      person_id = nil
      person_age = 55
      person_classroom = 'A1'
      person_name = 'Madara'
      person_parent_permission = 'Y'
      person_object = Student.new(person_id, person_age, person_classroom, person_name, person_parent_permission)
      expect(person_object.age).to be_between(40, 60).inclusive
    end

    it 'Should match the A1 classroom' do
      person_id = nil
      person_age = 18
      person_classroom = 'A1'
      person_name = 'Madara'
      person_parent_permission = 'Y'
      person_object = Student.new(person_id, person_age, person_classroom, person_name, person_parent_permission)
      expect(person_object.classroom).to match(/A1/)
    end
    it 'Should not have parent permission' do
      person_id = nil
      person_age = 18
      person_classroom = 'A1'
      person_name = 'Madara'
      person_parent_permission = 'N'
      person_object = Student.new(person_id, person_age, person_classroom, person_name, person_parent_permission)
      expect(person_object.parent_permission).to eql 'N'
    end
  end
end
