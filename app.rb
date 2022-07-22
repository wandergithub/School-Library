require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'

class App
  attr_accessor :books, :people

  def initialize
    @books = []
    @people = []
  end

  def create_person(type, age, name, parent_permissions = true, specialization = 'default')
    case type
    when '1'
      @people << Student.new(age, name, parent_permissions)
    when '2'
      @people << Teacher.new(age, specialization, name, parent_permissions)
    end
  end

  def create_book(title, author)
    @books << Book.new(title, author)
  end

  def create_rental(date, book, person)
    Rental.new(date, book, person)
  end
end
