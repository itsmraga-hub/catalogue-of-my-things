require_relative '../item'

class Book < Item
  def initialize(publish_date, publisher, cover_state, _id = Random.rand(1...1000))
    super(publish_date)
    @id = Random.rand(1...1000)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end

  attr_accessor :publisher, :cover_state
end

