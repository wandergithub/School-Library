require_relative "Person"

class Teacher < Person
  def initialize(specialization)
    super
    @specialization = specialization
  end

  def can_use_service?
    true
  end

end

