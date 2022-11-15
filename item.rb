class Item
  def initialize(label, publish_date, archived: true)
    @id = Random.rand(1...1000)
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def can_be_archived?
    2022 - @publish_date > 10
  end

  def move_to_archive!
    @archived = true if can_be_archived?
  end
  attr_accessor :publish_date, :id, :archived
end
