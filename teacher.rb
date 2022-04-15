require_relative './person'
class Teacher < Person
  def initialize(specialization, age, name)
    super(age, true, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
