require_relative '../item'

class MusicAlbum < Item
  attr_reader :name, :publish_date, :genre, :on_spotify

  def initialize(name, on_spotify, publish_date)
    @name = name
    @on_spotify = on_spotify
    super(publish_date)
  end

  def genre=(genre)
    @genre = genre
    genre.music_album_items.push(self) unless genre.music_album_items.include?(self)
  end

  def can_be_archived?
    (super && on_spotify?)
  end

  def on_spotify?
    @on_spotify
  end
end
