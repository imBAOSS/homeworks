class Card
  attr_reader :id, :hidden

  def initialize(id)
    @hidden = true
    @id = id
  end

  def hide
    @hidden = true
  end

  def reveal
    @hidden = false
  end

  def ==(card)
    @id == card.id
  end

  def to_s
    @id.to_s
  end

end
