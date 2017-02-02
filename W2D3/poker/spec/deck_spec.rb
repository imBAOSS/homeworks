require 'deck'
require 'set'

describe Deck do

  subject(:sample_deck) { Deck.new }

  describe "#initialize" do

    it "initializes with deck as an array" do
      expect(sample_deck.cards).to be_a(Array)
    end

    it "initializes with a deck of cards" do
      sample_deck.cards.all? { |card| expect(card).to be_a(Card) }
    end

    it "initializes a deck of the right length" do
      expect(sample_deck.cards.length).to eq(52)
    end

    it "initializes a deck with all unique cards" do
      seen = Set.new()
      sample_deck.cards.each do |card|
        seen.add("#{card.suit} #{card.value}")
      end

      expect(seen.length).to eq(52)

    end

  end

end
