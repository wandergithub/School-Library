require 'securerandom'
require '../nameable'
require '../trimmer_decorator'
require '../capitalize_decorator'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permissions: false)
    @name = name
    @age = age
    @parent_permissions = parent_permissions
    @id = SecureRandom.uuid
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

p person = Person.new(22, 'maximilianus')
p person.correct_name
p capitalizedPerson = CapitalizeDecorator.new(person)
p capitalizedPerson.correct_name
p capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
p capitalizedTrimmedPerson.correct_name
