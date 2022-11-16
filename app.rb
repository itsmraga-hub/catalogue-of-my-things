require './musicAlbum/genre'
require './musicAlbum/music_album'
require './Book/book'
require './Book/label'
require './file'
require './music'
require 'json'
require_relative './games/game'
require_relative './authors/author'
require_relative './games/create_game'

class App
  include CreateGame

  def initialize
    @music = Music.new
    @books = []
    @labels = []
    @games = []
    @authors = []
    @file_games = Persist.new('store/games.json')
    @file_authors = Persist.new('store/authors.json')
    @file_book = Persist.new('store/book.josn')
    @file_label = Persist.new('store/label.json')
  end

  def list_music_albums
    @music.list_music_albums
  end

  def list_genres
    @music.list_genres
  end

  def add_music_album
    @music.add_music_album
  end

  def create_music_album(id)
    @music.create_music_album(id)
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
