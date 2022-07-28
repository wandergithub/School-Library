class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rental << self

    @person = person
    person.rental << self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [date, book, person]
    }.to_json(*args)
  end

  # Deserialize JSON string by constructing new Foo object with arguments.
  def self.json_create(object)
    new(*object['a'])
  end
end
