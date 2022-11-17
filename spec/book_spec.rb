require_relative '../Book/book'

describe Book do
  context 'When testing the Book class' do
    it 'initializes with all variables' do
      book = Book.new(2022, 'RK Publishing House', 'good')
      expect(book.publish_date).to eq 2022
      expect(book.publisher).to eq 'RK Publishing House'
      expect(book.cover_state).to eq 'good'
    end

    it 'tests can_be_archived method' do
      book = Book.new(2022, 'RK Publishing House', 'good')
      expect(book.can_be_archived?).to eq false
      book_two = Book.new(2002, 'RK Publishing House', 'good')
      expect(book_two.can_be_archived?).to eq true
      book_three = Book.new(2022, 'RK Publishing House', 'bad')
      expect(book_three.can_be_archived?).to eq true
    end
  end
end
