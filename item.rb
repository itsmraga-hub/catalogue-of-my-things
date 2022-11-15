require_relative './authors/author'

class Item
  attr_accessor :publish_date, :id, :archived

  def initialize(publish_date, archived: true)
    @id = Random.rand(1...1000)
    @publish_date = publish_date
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
    genre.music_album_items << self
  end

  def can_be_archived?
    2022 - @publish_date > 10
  end

  def move_to_archive!
    @archived = true if can_be_archived?
  end

  def add_author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end
end
