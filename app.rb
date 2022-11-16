require './musicAlbum/genre'
require './musicAlbum/music_album'
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
    @games = []
    @authors = []
    @file_games = Persist.new('store/games.json')
    @file_authors = Persist.new('store/authors.json')
    @file_music_albums = Persist.new('store/music_albums.json')
    @file_genres = Persist.new('store/genres.json')
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
    music_list = @file_music_albums.load
    @music_albums.each do |music|
      music_list << {
        name: music.name,
        on_spotify: music.on_spotify,
        genre: music.genre.name
      }
    end
    @file_music_albums.save(music_list)
  end

  def add_genre
    puts 'Add Genre name: '
    name = gets.chomp
    @genres.push(Genre.new(name))
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
