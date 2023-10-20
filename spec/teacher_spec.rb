require_relative '../module/teacher'

describe Teacher do
  context 'When testing the Teacher class methods' do
    it 'Should respond true to :specialization, :name, :id, :parent_permission methods' do
      person_id = nil
      person_age = 26
      person_specialization = 'Software Development'
      person_name = 'Graciano Henrique'
      person_object = Teacher.new(person_id, person_age, person_specialization, person_name)
      expect(person_object).to respond_to(:id)
      expect(person_object).to respond_to(:name)
      expect(person_object).to respond_to(:specialization)
      expect(person_object).to respond_to(:parent_permission)
    end

    it "Should match the person's name Graciano Henrique, Graciano Manuel Henrique and with valid id}" do
      person_id = nil
      person_age = 26
      person_specialization = 'Software Development'
      person_name = 'Graciano Manuel'
      person_object = Teacher.new(person_id, person_age, person_specialization, person_name)
      expect(person_object.name).to match(/Graciano Manuel/i)
      person_full_name = "#{person_object.name} Henrique"
      person_object.name = person_full_name
      person_object.id
      expect(person_object.id.class).to equal Integer
      expect(person_object.name).to match(/Graciano Manuel Henrique/i)
    end

    it "The person's age Should be in 20..30 years " do
      person_id = nil
      person_age = 26
      person_specialization = 'Software Development'
      person_name = 'Graciano Manuel'
      person_object = Teacher.new(person_id, person_age, person_specialization, person_name)
      expect(person_object.age).to be_between(18, 30).inclusive
      person_object.age = person_object.age + 10
      expect(person_object.age).not_to be_between(18, 36).exclusive
    end

    it 'Should return The person specialization and match Full-Stack web Developer' do
      person_id = nil
      person_age = 26
      person_specialization = 'Software Development'
      person_name = 'Graciano Manuel'
      person_object = Teacher.new(person_id, person_age, person_specialization, person_name)
      expect(person_object.specialization).to match(/Software Development/i)
      person_object.specialization = 'Full-Stack web Developer'
      expect(person_object.specialization).to match(/Full-Stack web Developer/i)
    end
  end
end
