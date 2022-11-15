require_relative '../item'

class MusicAlbum < Item
  def initialize(name, on_spotify, publish_date, archived)
    @name = name
    @on_spotify = on_spotify
    super(publish_date, archived: archived)
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
