require_relative '../Book/label'
require_relative '../Book/book'

describe Label do
  label = Label.new('Gift', 'blue')
  book = Book.new(2022, 'RK Publishing House', 'good')
  label.add_item(book)

  it 'initializes with all variables' do
    expect(label.title).to eq 'Gift'
    expect(label.color).to eq 'blue'
  end

  it 'Adds books to labels_items list' do
    expect(label.items.length).to eq 1
    book_two = Book.new(2022, 'RK Publishing House', 'good')
    label.add_item(book_two)
    expect(label.items.length).to eq 2
  end
end
