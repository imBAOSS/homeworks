require 'set'

class Hand

  SUITS = [:clubs, :diamonds, :hearts, :spades]

  attr_reader :cards

  def initialize(cards)
    validate_hand(cards)
    @cards = cards
  end

  def beats_hand?(other_hand)
    other_highest_card = other_hand.highest_card

    if is_straight_flush?
      return true unless other_hand.is_straight_flush?
      highest_card.beats?(other_highest_card)
    end

    if is_four_of_a_kind?
      return true unless other_hand.is_four_of_a_kind?

      four_value = has_matches.select { |k, v| v == 4 }.keys[0]
      other_four_value = other_hand.has_matches.select { |k, v| v == 4 }.keys[0]

      four_value > other_four_value
    end

    if is_full_house?
      return true unless other_hand.is_full_house?

      three_value = has_matches.select { |k, v| v == 3 }.keys[0]
      other_three_value = other_hand.has_matches.select { |k, v| v == 3 }.keys[0]

      three_value > other_three_value
    end

    if is_flush?
      return true unless other_hand.is_flush?
      highest_card.beats?(other_highest_card)
    end

    if is_straight?
      return true unless other_hand.is_straight?
      highest_card.beats?(other_highest_card)
    end

    if is_three_of_a_kind?
      return true unless other_hand.is_three_of_a_kind?

      three_value = has_matches.select { |k, v| v == 3 }.keys[0]
      other_three_value = other_hand.has_matches.select { |k, v| v == 3 }.keys[0]

      three_value > other_three_value
    end

    if is_two_pair?
      return true unless other_hand.is_two_pair?

      pair_value = has_matches.select { |k, v| v == 2 }.keys
      other_pair_value = other_hand.has_matches.select { |k, v| v == 2 }.keys

      pair_value.sort.last > other_pair_value.sort.last
    end

    if is_one_pair?
      return true unless other_hand.is_one_pair?

      one_value = has_matches.select { |k, v| v == 2 }.keys[0]
      other_one_value = other_hand.has_matches.select { |k, v| v == 2 }.keys[0]

      one_value > other_one_value
    end

    highest_card.beats?(other_highest_card)
  end

  def highest_card
    @cards.sort_by { |card| card.value }.last
  end

  def is_straight_flush?
    is_flush? && is_straight?
  end

  def is_four_of_a_kind?
    has_matches.values.include?(4)
  end

  def is_full_house?
    @cards.map { |card| card.value }.uniq.length == 2
  end

  def is_flush?
    @cards.map { |card| card.suit }.uniq.length == 1
  end

  def is_straight?
    values = @cards.map { |card| card.value }.sort
    values[0] + 4 == values[4] || values == [2, 3, 4, 5, 14]
  end

  def is_three_of_a_kind?
    has_matches.values.include?(3)
  end

  def is_two_pair?
    has_matches.values.sort == [1, 2, 2]
  end

  def is_one_pair?
    has_matches.values.include?(2)
  end

  def has_matches
    values_count = Hash.new { |h, k| h[k] = 0 }
    @cards.each { |card| values_count[card.value] += 1 }
    values_count
  end

  private

  def validate_hand(cards)
    raise "hand size is invalid!" unless cards.length == 5

    uniqs = Set.new
    cards.each { |card| uniqs.add("#{card.suit} #{card.value}") }
    raise "cards are not unique!" unless uniqs.length == 5
  end



end
