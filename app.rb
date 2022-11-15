require './musicAlbum/genre'
require './musicAlbum/music_album'

class App
  def initialize
    @genres = []
    @music_albums = []
  end

  def list_music_albums
    puts "Current Music Albums"
    @music_albums.each_with_index do |album, i|
      puts "#{i + 1}) Music Album name: #{album.name}"
    end
  end

  def list_genres
    puts "Current Genres available"
    @genres.each_with_index do |genre, i|
      puts "Genre #{i + 1}: #{genre}"
  end

  def add_music_album
    
  end

  def add_genre

  end
end
