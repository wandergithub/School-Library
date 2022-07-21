#!/usr/bin/env ruby
require_relative 'app'

def display_options
  mainOptions = "\n\nPlease choose an option by entering a number:
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for a given person id
  7 - Exit\n"
  puts mainOptions
  print "Option:"
end

def list_books(app)
  app.books.each do
    |book|
    puts "Title: #{book.title},  Author: #{book.author}"
  end
end

def list_people(app)
  app.people.each do
    |person|
    puts "[#{person.class}]  Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
end

def create_person(app)
  print 'Do you want to create a student(1) or a teacher(2)? [Input the number]:  '
  type = gets.chomp
  print "Age:  "
  age = gets.chomp
  print "name:  "
  name = gets.chomp
  if type == '1'
    print "Has pararent permission? [y/n]"
    parent_permission = gets.chomp
    parent_permission = (parent_permission.downcase == 'y') ? true : false
    app.create_person(type, age, name, parent_permissions: parent_permission)
  elsif type == '2'
    print "Specialization:  "
    specialization = gets.chomp
    app.create_person(type, age, name, true, specialization)
  end
  puts 'Person created successfully!'
end

def create_book(app)
  print "Title:  "
  title = gets.chomp
  print "Author:  "
  author = gets.chomp
  app.create_book(title, author)
  puts 'Book created successfully'
end

def main
  app = App.new
  puts "\n\nWelcome to School Library App!"
  until(false)
    display_options
    selected = gets.chomp
    case selected
    when "1"
      list_books(app)
    when "2"
      list_people(app)
    when "3"
      create_person(app)
    when "4"
      create_book(app)
    when "5"
    when "6"
    when "7"
      break
    else
      puts "\nUnvalid option, please write a number inside the available options\n"
    end
  end
end

main()
