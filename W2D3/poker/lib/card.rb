class Card

  attr_reader :suit, :value

  SUITS = [:clubs, :diamonds, :hearts, :spades]

  def initialize(suit, value)
    raise "invalid suit!" unless SUITS.include?(suit)
    raise "invalid value!" unless (2..14).include?(value)
    @suit = suit
    @value = value
  end

  def beats?(other_card)
    return true if @value > other_card.value
    return false if @value < other_card.value

    SUITS.index(@suit) > SUITS.index(other_card.suit)
  end

end
