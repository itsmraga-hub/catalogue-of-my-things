class Item
  def initialize(publish_date, archived: false)
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
end
