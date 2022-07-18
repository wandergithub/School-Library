class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(name = "Unknown", parent_permissions = true, age)
    @name = name
    @age = age
    @parent_permissions = parent_permissions
  end

  def can_use_services?
    is_of_age? || parent_permissions
  end

  private
  def is_of_age?
    @age >= 18
  end

end
