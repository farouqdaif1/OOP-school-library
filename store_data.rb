require 'json'
require_relative './book'
require_relative './student'

module DataStore
  def write_books(title, author)
    data = []
    data.push(Book.new(title, author))
    json = if File.exist?('books.json')
             load_book.push({ title: title, author: author })
           else
             data.map { |book| { title: book.title, author: book.author } }
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
             load_people.push({ class: data[-1].class, name: data[-1].name, id: data[-1].id, age: data[-1].age })
           else
             data.map { |person| { class: person.class, name: person.name, id: person.id, age: person.age } }
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
end
