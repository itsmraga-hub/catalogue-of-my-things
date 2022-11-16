require_relative '../Book/book'

describe Book do
  context 'When testing the Book class' do
    it 'initializes with all variables' do
      book = Book.new(2022, 'RK Publishing House', 'good')
      expect(book.publish_date).to eq 2022
      expect(book.publisher).to eq 'RK Publishing House'
      expect(book.cover_state).to eq 'good'
    end
  end
end
