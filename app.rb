require './musicAlbum/genre'
require './musicAlbum/music_album'
require './file'
require 'json'
require 'pry'

class App
  def initialize
    @genres = []
    @music_albums = []
    @books = []
    @labels = []
    @file_music_albums = Persist.new('store/music_albums.json')
    @file_genres = Persist.new('store/genres.json')
  end

  def list_music_albums
    puts 'Current Music Albums'
    # binding.pry
    @music_albums.each_with_index do |album, i|
      puts "#{i + 1}] Music Album name: #{album.name} Genre: #{album.genre.name}"
    end
    puts
  end

  def list_genres
    puts 'Current Genres available'
    @genres.each_with_index do |genre, i|
      puts "Genre index #{i}: #{genre.name}"
    end
    puts
  end

  def add_music_album
    puts 'Which Genre: '
    list_genres
    print 'Is your genre in the list[Y/N]: '
    choice = gets.chomp.upcase
    case choice
    when 'Y'
      print 'Enter genre id: '
      id = gets.chomp.to_i
      create_music_album(id)
    when 'N'
      create_genre
      create_music_album(-1)
    else
      puts 'Wrong choice, try again'
    end
  end

  def create_genre
    print 'Add Genre: '
    name = gets.chomp
    @genres.push(Genre.new(name))
  end

  def create_music_album(index)
    print 'Create Music album:
    Enter Title: '
    title = gets.chomp
    print 'Is it on spotify:[true(T)/false(F)]: '
    on_spotify = gets.chomp.downcase
    on_spotify = on_spotify == 't'
    print 'Release year[Year only] e.g. 1990 or 2011: '
    year = gets.chomp.to_i
    music_album = MusicAlbum.new(title, on_spotify, year)
    @genres[index].add_item(music_album)
    @music_albums.push(music_album)
    # binding.pry
  end

  def add_genre
    puts 'Add Genre name: '
    name = gets.chomp
    @genres.push(Genre.new(name))
  end

  # BOOk and Label-----

  def list_books
    puts 'Current books'
    @books.each_with_index do |bk, i|
      puts "#{i}) publish_date: #{bk.publish_date}, publisher: #{bk.publisher}, cover_state: #{bk.cover_state} "
    end
    puts
  end

  def list_label
    puts 'Current labels availeble '
    @labels.each_with_index do |label, i|
      puts "Label Index #{i}: #{label.title}, Color: #{label.color}"
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
  end

  def create_label
    print 'Add Label:'
    title = gets.chomp
    print 'Add Color:'
    color = gets.chomp
    @labels.push(Label.new(title, color))
  end
end
