require_relative '../module/nameable'
require_relative '../module/person'
require_relative '../module/student'


describe Nameable do
  context 'When testing the Nameable  class and its methods' do
    it 'Nameable class Should have  :correct_name method' do
      nameable_item = Nameable.new
      expect(nameable_item).to respond_to(:correct_name)
    end

    it 'Should be a nameable object instance' do
      nameable_item = Nameable.new
      expect(nameable_item).to be_instance_of Nameable
    end

    it 'Should not be a student object instance' do
      nameable_item = Nameable.new
      expect(nameable_item).not_to be_instance_of Student
    end

    it 'Should raise a NotImplementedError' do
      nameable_item = Nameable.new
      expect { nameable_item.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
