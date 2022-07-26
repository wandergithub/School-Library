require 'json'
require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
require 'pry'

class App
  attr_accessor :books, :people

  def initialize
    @books = []
    @people = []
    load_files
  end
  
  def load_files
    books_file = File.open('books.json')
    json = books_file.read
    if json != ""
      arr = JSON.parse(json, create_additions: true)
      arr.each { |json|  @books << JSON.parse(json, create_additions: true) }
    end
    books_file.close
  end

  def save_data
    arr = []
    @books.each { |book| arr << JSON.generate(book) }
    File.write('books.json',arr)
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
