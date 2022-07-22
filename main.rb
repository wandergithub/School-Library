#!/usr/bin/env ruby
require_relative 'app'

def display_options
  main_options = "\n\nPlease choose an option by entering a number:
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for a given person id
  7 - Exit\n"
  puts main_options
  print 'Option:'
end

def list_books(app)
  app.books.each do |book|
    puts "Title: #{book.title},  Author: #{book.author}"
  end
end

def list_people(app)
  app.people.each do |person|
    puts "[#{person.class}]  Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
end

def create_person(app)
  print 'Do you want to create a student(1) or a teacher(2)? [Input the number]:  '
  type = gets.chomp
  print 'Age:  '
  age = gets.chomp
  print 'name:  '
  name = gets.chomp
  case type
  when '1'
    print 'Has pararent permission? [y/n]'
    parent_permission = gets.chomp
    parent_permission = (parent_permission.downcase == 'y')
    app.create_person(type, age, name, parent_permissions: parent_permission)
  when '2'
    print 'Specialization:  '
    specialization = gets.chomp
    app.create_person(type, age, name, true, specialization)
  end
  puts 'Person created successfully!'
end

def create_book(app)
  print 'Title:  '
  title = gets.chomp
  print 'Author:  '
  author = gets.chomp
  app.create_book(title, author)
  puts 'Book created successfully'
end

def create_rental(app)
  puts 'Select a book from the following list by number:'
  app.books.each do |book|
    puts "#{app.books.index(book)}) Title: #{book.title}, Author: #{book.author}"
  end
  book_index = gets.chomp
  book_index = book_index.to_i

  puts "\nSelect a person from the following list by number (not id)"
  app.people.each do |person|
    puts "#{app.people.index(person)})  [#{person.class}]  Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
  person_index = gets.chomp
  person_index = person_index.to_i

  print "\nDate:  "
  date = gets.chomp

  app.create_rental(date, app.books[book_index], app.people[person_index])
  puts 'Rental created successfully'
end

def list_rentals(app)
  print 'ID of person:  '
  desired_id = gets.chomp
  puts 'Rentals:'
  app.people.each do |person|
    next unless person.id == desired_id.to_i

    person.rental.each do |rental|
      puts "Date:  #{rental.date}, Book:  #{rental.book.title} by #{rental.person.name}"
    end
  end
end

def user_interaction(app)
  loop do
    display_options
    selected = gets.chomp
    case selected
    when '1'
      list_books(app)
    when '2'
      list_people(app)
    when '3'
      create_person(app)
    when '4'
      create_book(app)
    when '5'
      create_rental(app)
    when '6'
      list_rentals(app)
    when '7'
      puts 'Thank you for using the app!'
      break
    else
      puts "\nUnvalid option, please write a number inside the available options\n"
    end
  end
end

def main
  app = App.new
  puts "\n\nWelcome to School Library App!"
  user_interaction(app)
end

main()
