require_relative '../book'

describe Book do
  context 'It should create book and add rentals' do
    book = Book.new('Title', 'Author')

    it 'return correct title' do
      expect(book.title).to eq 'Title'
    end

    it 'return correct author' do
      expect(book.author).to eq 'Author'
    end

    it 'return array of rentals' do
      book.add_rental(book)
      expect(book.rentals.length).to eq 1
    end
  end
end
