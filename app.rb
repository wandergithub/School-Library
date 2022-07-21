require_relative 'teacher'
require_relative 'student'

class App
  def create_person(type, age, name, parent_permissions = true, specialization= "default")
    if type == '1'
      Student.new(age, name, parent_permissions)
    elsif type == '2'
      Teacher.new(age, specialization , name, parent_permissions)
    end
  end
end
