require_relative 'nameable'
require_relative 'trimmer_decorator'
require_relative 'capitalize_decorator'

class Person < Nameable
  attr_reader :id, :rental
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permissions: false)
    super()
    @name = name
    @age = age
    @parent_permissions = parent_permissions
    @id = rand(500)
    @rental = []
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  def can_use_services?
    of_age? || @parent_permissions
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
