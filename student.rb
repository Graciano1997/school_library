require_relative 'person'

class Student < Person
  def initialize(classroom)
    super(20)
    @classroom = classroom
  end

  def play_hooky
    puts '¯(ツ)/¯'
  end
end
