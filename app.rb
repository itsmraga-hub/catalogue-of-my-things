require './musicAlbum/genre'
require './musicAlbum/music_album'
require './file'
require './music'
require 'json'
require 'pry'

class App
  def initialize
    # @genres = []
    # @music_albums = []
    # @file_music_albums = Persist.new('store/music_albums.json')
    # @file_genres = Persist.new('store/genres.json')
    @music = Music.new
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

end
