require_relative '../module/teacher'
require_relative '../module/nameable'
require_relative '../module/capitalize_decorator'

describe CapitalizeDecorator do
  context 'When testing the CapitalizeDecorator class and its methods' do
    it 'CapitalizeDecorator class Should have  :correct_name method' do
      nameable_item = Nameable.new
      capitalize_decorator_item = CapitalizeDecorator.new(nameable_item)
      expect(capitalize_decorator_item).to respond_to(:correct_name)
    end
    it 'CapitalizeDecorator class Should have  :correct_name method' do
      person_id = nil
      person_age = 26
      person_specialization = 'Software Development'
      person_name = 'graciano'
      person_object = Teacher.new(person_id, person_age, person_specialization, person_name)
      capitalize_decorator_item = CapitalizeDecorator.new(person_object)
      expect(capitalize_decorator_item.correct_name).to match(/Graciano/)
    end
  end
end
