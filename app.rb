require_relative 'teacher'
require_relative 'student'
require_relative 'book'

class App
  def create_person(type, age, name, parent_permissions = true, specialization= "default")
    if type == '1'
      Student.new(age, name, parent_permissions)
    elsif type == '2'
      Teacher.new(age, specialization , name, parent_permissions)
    end
  end

  def create_book(title, author)
    Book.new(title, author)
  end
end
