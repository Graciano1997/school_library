require_relative '../module/nameable'
require_relative '../module/Teacher'
require_relative '../module/base_decorator'

describe BaseDecorator do
  context 'When testing the BaseDecorator class and its methods' do
    it 'BaseDecorator class Should have  :correct_name method' do
      nameable_item = Nameable.new
      base_decorator_item = BaseDecorator.new(nameable_item)
      expect(base_decorator_item).to respond_to(:correct_name)
    end

    it 'Should be a BaseDecorator object instance' do
      nameable_item = Nameable.new
      base_decorator_item = BaseDecorator.new(nameable_item)
      expect(base_decorator_item).to be_instance_of BaseDecorator
    end

    it 'BaseDecorator correct_name method Should match wonde ' do
      person_id = nil
      person_age = 30
      person_specialization = 'Software Development'
      person_name = 'wonde'
      person_object = Teacher.new(person_id, person_age, person_specialization, person_name)
      base_decorator_item = BaseDecorator.new(person_object)
      expect(base_decorator_item.correct_name).to match(/wonde/)
    end
  end
end
