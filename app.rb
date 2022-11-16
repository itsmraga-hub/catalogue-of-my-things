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
require './book_file'

class App
  include CreateGame

  def initialize
    @music = Music.new
    @book_file = BookFile.new
    @games = []
    @authors = []
    @file_games = Persist.new('store/games.json')
    @file_authors = Persist.new('store/authors.json')
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

  # book and label
  def list_books
    @book_file.list_books
  end

  def list_label
    @book_file.list_label
  end

  def add_books
    @book_file.add_books
  end

  def create_label
    @book_file.create_label
  end

  def create_game
    add_game
  end

  ## games
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
