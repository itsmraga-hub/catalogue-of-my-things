require_relative './music_album'
# require 'pry'

class Genre
  attr_accessor :name
  attr_reader :music_album_items, :id

  def initialize(name)
    @id = Random.rand(1...1000)
    @name = name
    @music_album_items = []
  end

  def add_item(item)
    @music_album_items << item
    item.genre = self
  end
end

# g = Genre.new('RnB')
# m = MusicAlbum.new('Love song', true, 2010, false)
# m_two = MusicAlbum.new('Hate song', true, 2020, false)

# binding.pry
