require_relative './student'
require_relative './book'
require_relative './person'
require_relative './teacher'
require_relative './rental'
require_relative './store_data'
class App
  include DataStore
  def initialize
    @books = load_book
    @people = load_people
    @rentals = []
  end

  #   List all books.
  def list_all_books
    puts('No books found') if @books.empty?
    @books.each_with_index do |book, index|
      puts("(#{index + 1})- Title: #{book['title']} , Author: #{book['author']}")
    end
  end

  # List all people.
  def list_all_people
    puts('No person found') if @people.empty?
    @people.each_with_index do |person, index|
      puts("(#{index + 1})- #{person['class']}, Name : #{person['name']} ,ID: #{person['id']} ,Age: #{person['age']}")
    end
  end
  #   Create a person

  def create_person
    print('Do you want to create a student (1) or teacher (2) [input the number] :')
    x = gets.chomp.chomp.to_i
    case x
    when 1
      create_student
    when 2
      create_teacher
    else
      puts("You gave me #{x} -- I have no idea what to do with that.")
    end
  end
  #   Create a book.

  def create_book
    print('Title:')
    title = gets.chomp
    print('Author:')
    author = gets.chomp
    write_books(title, author)
    puts('Book created Successfully')
  end
  #   Create a rental.

  def create_rental
    puts('Select a book from the following list by number:')
    list_all_books
    book_number = gets.chomp.to_i
    puts('Select aperson from the following list by  number (not id):')
    list_all_people
    person_number = gets.chomp.to_i
    print('Date:')
    date = gets.chomp
    @rentals.push(Rental.new(date, @books[book_number - 1], @people[person_number - 1]))
    puts('Rental created Successfully')
  end

  #   List all rentals for a given person id.
  def list_all_rentals
    print('ID for person: ')
    id = gets.chomp.to_i
    print('Rentals :')
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Peson: #{rental.person.name} Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      else
        puts 'No Rentals found for the given ID'
      end
    end
  end

  def main_menue
    puts("
        PLease choose an option by enterin a number:
        1-List all books.
        2-List all people.
        3-Create a person (teacher or student, not a plain Person).
        4-Create a book.
        5-Create a rental.
        6-List all rentals for a given person id.
        7-Exist
        ")
  end

  def select_from_main1(num)
    case num
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    when 4
      create_book
    end
  end

  def select_from_main2(num)
    case num
    when 5
      create_rental
    when 6
      list_all_rentals
    when 7
      exit
    end
  end

  def select_from_main(num)
    case num
    when 1..4
      select_from_main1(num)
    when 5..7
      select_from_main2(num)
    else
      puts "You gave me #{num} -- I have no idea what to do with that."
    end
  end

  private

  #   Create  student, not a plain Person.

  def create_student
    print('Age:')
    age = gets.chomp
    print('Name:')
    name = gets.chomp
    print('Has parent permission? [Y\N]:')
    permision = gets.chomp.capitalize
    case permision
    when 'Y'
      write_people(Student.new('classroom', age, name, true))
    when 'N'
      write_people(Student.new('classroom', age, name, false))
    else
      puts("You gave me #{permision} -- I have no idea what to do with that.")
    end

    puts('Person created Successfully')
  end
  #   Create  teacher, not a plain Person.

  def create_teacher
    print('Age:')
    age = gets.chomp
    print('Name:')
    name = gets.chomp
    print('Specializtion:')
    specializtion = gets.chomp
    write_people(Teacher.new(specializtion, age, name))
    print('Person created Successfully')
  end
end
