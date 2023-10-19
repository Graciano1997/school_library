require_relative 'person'

class Teacher < Person
  attr_accessor :specialization, :name, :id, :parent_permission

  def initialize(id, age, specialization, name)
    @specialization = specialization
    super(id, age, name, parent_permission: true)
  end

  def can_use_services?
    true
  end
end
