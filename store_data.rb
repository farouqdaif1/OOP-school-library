require 'json'
require_relative './book'
require_relative './student'

module DataStore
  def write_books(title, author)
    data = []
    data.push(Book.new(title, author))
    json = if File.exist?('books.json')
             load_book.push({ title: title, author: author, rentals: [] })
           else
             data.map { |book| { title: book.title, author: book.author, rentals: book.rentals } }
           end
    File.write('books.json', json.to_json)
  end

  def load_book
    if File.exist?('books.json')
      JSON.parse(File.read('books.json'))
    else
      []
    end
  end

  def write_people(man)
    data = []
    data.push(man)
    json = if File.exist?('people.json')
             load_people.push({ class: data[-1].class, name: data[-1].name, id: data[-1].id, age: data[-1].age,
                                rentals: [] })
           else
             data.map do |person|
               { class: person.class, name: person.name, id: person.id, age: person.age, rentals: person.rentals }
             end
           end
    File.write('people.json', json.to_json)
  end

  def load_people
    if File.exist?('people.json')
      JSON.parse(File.read('people.json'))
    else
      []
    end
  end

  def write_rentals(rentals)
    data = []
    data.push(rentals)
    json = if File.exist?('rentals.json')
             load_people.push({ person: data[-1].person['name'], Date: data[-1].date, Book: data[-1].book['title'],
                                author: data[-1].book['author'], id: data[-1].person['id'] })
           else
             data.map do |rental|
               { person: rental.person['name'], Date: rental.date, Book: rental.book['title'],
                 author: rental.book['author'], id: rental.person['id'] }
             end
           end
    File.write('rentals.json', json.to_json)
  end

  def load_rentlas
    if File.exist?('rentals.json')
      JSON.parse(File.read('rentals.json'))
    else
      []
    end
  end
end
