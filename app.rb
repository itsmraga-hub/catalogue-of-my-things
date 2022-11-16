require './musicAlbum/genre'
require './musicAlbum/music_album'
require './Book/book'
require './Book/label'
require './file'
require 'json'
require_relative './games/game'
require_relative './authors/author'
require_relative './games/create_game'

class App
  include CreateGame

  def initialize
    @genres = []
    @music_albums = []
    @books = []
    @labels = []
    @games = []
    @authors = []
    @file_games = Persist.new('store/games.json')
    @file_authors = Persist.new('store/authors.json')
    @file_music_albums = Persist.new('store/music_albums.json')
    @file_book = Persist.new('store/book.josn')
    @file_genres = Persist.new('store/genres.json')
    @file_label = Persist.new('store/label.json')
  end

  def list_music_albums
    puts 'Current Music Albums'
    music_list = @file_music_albums.load
    music_list.each_with_index do |album, i|
      puts "#{i + 1}] Music Album name: #{album['name']} Genre: #{album['genre']}"
    end
    puts
  end

  def list_genres
    puts 'Current Genres available'
    genres_list = @file_genres.load
    genres_list.each_with_index do |genre, i|
      puts "Genre index #{i}: #{genre['name']}"
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
      save_music
    when 'N'
      create_genre
      save_genres
      create_music_album(-1)
      save_music
    else
      puts 'Wrong choice, try again'
    end
  end

  def create_genre
    print 'Add Genre: '
    name = gets.chomp
    @genres.push(Genre.new(name))
    puts 'Genre Added'
  end

  def save_genres
    genres_list = @file_genres.load
    @genres.each do |genre|
      genres_list << {
        id: genre.id,
        name: genre.name
      }
    end
    @genres = []
    @file_genres.save(genres_list)
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
    genres_list = @file_genres.load
    genre = Genre.new(genres_list[index]['name'])
    genre.add_item(music_album)
    @music_albums.push(music_album)
  end

  def save_music
    music_list = @file_music_albums.load
    @music_albums.each do |music|
      music_list << {
        name: music.name,
        on_spotify: music.on_spotify,
        genre: music.genre.name
      }
    end
    @music_albums = []
    @file_music_albums.save(music_list)
  end

  def add_genre
    puts 'Add Genre name: '
    name = gets.chomp
    @genres.push(Genre.new(name))
  end

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

  def create_game
    add_game
  end

  def list_all_games
    games_list = @file_games.load

    if games_list.empty?
      puts 'Oops!! There are no any games at the moment.'
    else
      games_list.each do |game,|
        puts "#{game['name_of_game']} by #{game['first_name']} MP:#{game['multiplayer']} LP:#{game['last_played_at']}"
      end
    end
  end

  def list_all_authors
    authors_list = @file_authors.load

    if authors_list.empty?
      puts 'Ooop!! There are no authors at the moment. Try adding one!'
    else
      authors_list.each_with_index do |author, index|
        puts "#{index + 1}. NAME: #{author['first_name']} #{author['last_name']}"
      end
    end
  end
end
