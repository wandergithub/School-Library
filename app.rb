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
    rental_file = File.open('rentals.json')
    rentals = JSON.parse(rental_file.read, create_additions: true)
    json = books_file.read
    # Load books
    if json != ''
      arr = JSON.parse(json, create_additions: true)
      arr.each { |books_json| @books << JSON.parse(books_json, create_additions: true) }
    end
    books_file.close
    # Load people
    people_file = File.open('people.json')
    json = people_file.read
    if json != ''
      arr = JSON.parse(json, create_additions: true)
      arr.each { |people_json| @people << JSON.parse(people_json, create_additions: true) }
    end
    # Load rentals
    if rentals != ''
      (0...rentals.length).each do |i|
        rental = JSON.parse(rentals[i], create_additions: true)
        @books.each { |book| book.rental << rental[0] if rental[0].book.title == book.title }
        @people.each { |person| person.rental << rental[0] if rental[0].person.name == person.name }
      end
    end
    # binding.pry
    people_file.close
    rental_file.close
  end

  def save_data
    arr = []
    @books.each { |book| arr << JSON.generate(book) }
    File.write('books.json', arr)

    arr = []
    @people.each { |person| arr << JSON.generate(person) }
    File.write('people.json', arr)

    rentals = []
    @books.each { |book| rentals << JSON.generate(book.rental) unless book.rental == [] }
    File.write('rentals.json', rentals)
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
