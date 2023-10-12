require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = Capitalize_Decorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = Trimmer_Decorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name