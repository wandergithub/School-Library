require_relative 'person'

class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parent_permissions: true)
    super(age, name, parent_permissions: parent_permissions)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
