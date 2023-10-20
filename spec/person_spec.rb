require_relative '../module/teacher'
require_relative '../module/person'

describe Person do
  context 'When testing the Person class methods' do
    it 'Should respond true to :name, :age, :rentals, :id, :parent_permission methods' do
      person_id = nil
      person_age = 36
      person_parent_permission = true
      person_name = 'Ariel'
      person_object = Person.new(person_id, person_age, person_name, parent_permission: person_parent_permission)
      expect(person_object).to respond_to(:id)
      expect(person_object).to respond_to(:name)
      expect(person_object).to respond_to(:age)
      expect(person_object).to respond_to(:parent_permission)
      expect(person_object).to respond_to(:rentals)
    end

    it "Should  match the person's name Ariel" do
      person_id = nil
      person_age = 36
      person_parent_permission = true
      person_name = 'Ariel'
      person_object = Person.new(person_id, person_age, person_name, parent_permission: person_parent_permission)
      expect(person_object.name).to match(/Ariel/i)
    end

    it 'person Should  use the library' do
      person_id = nil
      person_age = 36
      person_parent_permission = true
      person_name = 'Ariel'
      person_object = Person.new(person_id, person_age, person_name, parent_permission: person_parent_permission)
      expect(person_object.can_use_services?).to be true
    end

    it 'Should  return the correct name' do
      person_id = nil
      person_age = 36
      person_parent_permission = true
      person_name = 'Ariel'
      person_object = Person.new(person_id, person_age, person_name, parent_permission: person_parent_permission)
      expect(person_object.correct_name).to match(/Ariel/i)
    end

    it 'person Should  be Adult' do
      person_id = nil
      person_age = 36
      person_parent_permission = true
      person_name = 'Ariel'
      person_object = Person.new(person_id, person_age, person_name, parent_permission: person_parent_permission)
      expect(person_object.send(:of_age?)).to be true
    end

    it 'person Should not  use the library' do
      person_id = nil
      person_age = 1
      person_parent_permission = false
      person_name = 'Hosanna'
      person_object = Person.new(person_id, person_age, person_name, parent_permission: person_parent_permission)
      expect(person_object.can_use_services?).to be false
    end

    it 'person Should not  be an Adult' do
      person_id = nil
      person_age = 1
      person_parent_permission = false
      person_name = 'Hosanna'
      person_object = Person.new(person_id, person_age, person_name, parent_permission: person_parent_permission)
      expect(person_object.send(:of_age?)).to be false
    end

    it 'Should Match the name kiko' do
      person_id = nil
      person_age = 33
      person_parent_permission = true
      person_name = 'kiko'
      person_object = Person.new(person_id, person_age, person_name, parent_permission: person_parent_permission)
      expect(person_object.correct_name).to match(/kiko/)
    end

    it 'Name Should be equal Unknown' do
      person_id = nil
      person_age = 36
      person_parent_permission = true
      person_object = Person.new(person_id, person_age, parent_permission: person_parent_permission)
      expect(person_object.name).to match(/Unknown/i)
    end

    it "The person's Should a default true parent_permission " do
      person_id = nil
      person_age = 36
      person_parent_permission = true
      person_name = 'Ariel'
      person_object = Person.new(person_id, person_age, person_name, parent_permission: person_parent_permission)
      expect(person_object.parent_permission).to be true
    end

    it 'Should not have parent permission' do
      person_id = nil
      person_age = 36
      person_parent_permission = false
      person_name = 'Ariel'
      person_object = Person.new(person_id, person_age, person_name, parent_permission: person_parent_permission)
      expect(person_object.parent_permission).not_to be true
    end
  end
end
