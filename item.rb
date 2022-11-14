class Item
  def initialize(label, publish_date, archived)
    @id = Random.rand(1...1000)
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  # def set_genre(genre); end

  # def set_author(author); end

  # def set_source(source); end

  def can_be_archived?
    2022 - @publish_date > 10
  end

  def move_to_archive!
    @archived = true if can_be_archived?
  end
end
