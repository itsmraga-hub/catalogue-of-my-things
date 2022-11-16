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
end
