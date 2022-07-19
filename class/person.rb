require 'securerandom'

class Person
  attr_accessor :id
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

  private

  def of_age?
    @age >= 18
  end
end
