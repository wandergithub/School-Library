require_relative 'teacher'
require_relative 'student'
require_relative 'book'

class App
  attr_accessor :books, :persons

  def initialize
    @books = []
  end
  
  def create_person(type, age, name, parent_permissions = true, specialization= "default")
    if type == '1'
      @persons << Student.new(age, name, parent_permissions)
    elsif type == '2'
      @persons << Teacher.new(age, specialization , name, parent_permissions)
    end
  end

  def create_book(title, author)
    @books << Book.new(title, author)
  end
end
