require_relative 'person'

class Student < Person
  def initialize(classroom, age, name = 'Unknown', parent_permissions: true)
    super(age, name, parent_permissions: parent_permissions)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
