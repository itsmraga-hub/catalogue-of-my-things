require './Book/book'
require './Book/label'
require './file'
require 'json'

class Book_File
  def initialize
    @labels = []
    @books = []
    @file_book = Persist.new('store/book_file.json')
    @file_label = Persist.new('store/label.json')
  end

  def list_books
    puts 'Current books'
    books_list = @file_book.load
    books_list.each_with_index do |bk, i|
      puts "#{i}) publish_date: #{bk['publish_date']}, publisher: #{bk['publisher']}, cover_state: #{bk['cover_state']} "
    end
    puts
  end

  def list_label
    labels_list = @file_label.load
    puts 'Current labels availeble '
    labels_list.each_with_index do |label, i|
      puts "Label Index #{i}: #{label['title']}, Color: #{label['color']}"
    end
  end

  def add_books
    create_label
    print 'OOPS Catlog# '
    print 'Publisher: '
    publisher = gets.chomp

    print 'OOP Catalog#'
    print 'Publish date:'
    publish_date = gets.chomp

    print 'OOPS Catalog#'
    print 'state of the cover (Good or Bad):'
    cover_state = gets.chomp
    book = Book.new(publish_date, publisher, cover_state)
    @books.push(book)
    save_book
  end

  def create_label
    print 'Add Label:'
    title = gets.chomp
    print 'Add Color:'
    color = gets.chomp
    @labels.push(Label.new(title, color))
    save_labels
  end

  def save_book
    book_list = @file_book.load
    @books.each do |book|
      book_list << {
        publish_date: book.publish_date,
        publisher: book.publisher,
        cover_state: book.cover_state
      }
    end
    @books = []
    @file_book.save(book_list)
  end

  def save_labels
    labels_list = @file_label.load
    @labels.each do |label|
      labels_list << {
        id: label.id,
        title: label.title,
        color: label.color
      }
    end
    @labels = []
    @file_label.save(labels_list)
  end
end
