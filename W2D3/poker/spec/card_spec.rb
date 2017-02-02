require 'card'

describe Card do

  subject(:queen_of_hearts) { Card.new(:hearts, 12) }

  describe "#initialize" do

    it "initializes with a suit" do
      expect(queen_of_hearts.suit).to eq(:hearts)
    end

    it "initializes with a value" do
      expect(queen_of_hearts.value).to eq(12)
    end

    it "raises an error for an invalid suit" do
      expect { Card.new(:banana, 2) }.to raise_error("invalid suit!")
    end

    it "raises an error for an invalid value" do
      expect { Card.new(:spades, 33) }.to raise_error("invalid value!")
    end

  end

  let(:jack_of_hearts) { Card.new(:hearts, 11) }
  let(:queen_of_spades) { Card.new(:spades, 12) }

  describe "#beats?" do
    it "returns true if passed a card of lesser value" do
      expect(queen_of_spades.beats?(jack_of_hearts)).to be true
    end

    it "returns true if passed a card of same value, lesser suit" do
      expect(queen_of_spades.beats?(queen_of_hearts)).to be true
    end

    it "returns false if passed a card of same value, higher suit" do
      expect(queen_of_hearts.beats?(queen_of_spades)).to be false
    end

    it "returns false if passed a card of higher value" do
      expect(jack_of_hearts.beats?(queen_of_hearts)).to be false
    end

  end

end
