require 'json'
require_relative './book'

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
end
