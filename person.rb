class Person

  def initialize(name="Unknown",age,parent_permission=true)
    @id=Math.sin(rand(0..45)*Math::PI) + Math.acos(rand(45..360)*Math::PI) + 1
    @name=name
    @age=age
  end

  attr_reader:id
  attr_accessor:name
  attr_accessor:age

  def of_age?
    if @age >= 18
      true
    else
      false
    end
  end

  def can_use_services?
    if of_age?() || parent_permission
      true
    else
      false
end
