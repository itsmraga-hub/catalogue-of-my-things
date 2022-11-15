require './musicAlbum/genre'
require './musicAlbum/music_album'
require './file'
require 'json'
require 'pry'

class App
  def initialize
    @genres = []
    @music_albums = []
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
end
