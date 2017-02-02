require 'hand'
require 'card'

describe Hand do

  describe "#initialize" do

    (2..6).each do |value|
      let("card#{value}".to_s) do
        object_double(Card.new(:hearts, value), suit: :hearts, value: value, class: Card)
      end
    end

    subject(:sample_hand) { Hand.new([card2, card3, card4, card5, card6]) }
    let(:too_small_hand) { Hand.new([card2, card3, card4, card5]) }
    let(:duplicate_hand) { Hand.new([card2, card3, card4, card4, card5]) }

    it "initializes with a hand of five" do
      expect(sample_hand.cards.length).to eq(5)
    end

    it "initializes with a hand of cards" do
      puts card5.class
      sample_hand.cards.each { |card| expect(card.class).to eq(Card) }
    end

    it "raises error unless hand size is five" do
      expect { too_small_hand }.to raise_error("hand size is invalid!")
    end

    it "raises error unless cards are unique" do
      expect { duplicate_hand }.to raise_error("cards are not unique!")
    end

  end

  suits = [:clubs, :diamonds, :hearts, :spades]

  (2..14).each do |value|
    suits.each do |suit|
      let("#{suit}_#{value}".to_sym) do
        object_double(Card.new(suit, value), suit: suit, value: value)
      end
    end
  end

  let(:straight_flush) { Hand.new([hearts_2, hearts_3, hearts_4, hearts_5, hearts_6]) }
  let(:four_of_a_kind) { Hand.new([hearts_7, spades_7, clubs_7, diamonds_7, hearts_8]) }
  let(:full_house) { Hand.new([hearts_7, spades_7, clubs_7, diamonds_8, hearts_8]) }
  let(:flush) { Hand.new([hearts_2, hearts_3, hearts_4, hearts_5, hearts_6]) }
  let(:straight) { Hand.new([hearts_2, hearts_3, hearts_4, hearts_5, hearts_6]) }
  let(:three_of_a_kind) { Hand.new([hearts_7, spades_7, clubs_9, diamonds_7, hearts_8]) }
  let(:two_pair) { Hand.new([hearts_7, spades_7, clubs_8, diamonds_9, hearts_8]) }
  let(:one_pair) { Hand.new([hearts_7, spades_7, clubs_9, diamonds_10, hearts_11]) }
  let(:random_hand) { Hand.new([hearts_7, spades_6, clubs_10, diamonds_4, hearts_3]) }

  describe "hand categories helper methods" do
    context "helper methods return true" do
      it "identifies a straight flush" do
        expect(straight_flush.is_straight_flush?).to be true
      end
      it "identifies a four of a kind" do
        expect(four_of_a_kind.is_four_of_a_kind?).to be true
      end
      it "identifies a full house" do
        expect(full_house.is_full_house?).to be true
      end
      it "identifies a flush" do
        expect(flush.is_flush?).to be true
      end
      it "identifies a straight" do
        expect(straight.is_straight?).to be true
      end
      it "identifies a three of a kind" do
        expect(three_of_a_kind.is_three_of_a_kind?).to be true
      end
      it "identifies a two pair" do
        expect(two_pair.is_two_pair?).to be true
      end
      it "identifies a one pair" do
        expect(one_pair.is_one_pair?).to be true
      end
      it "identifies highest card" do
        expect(random_hand.highest_card.value).to eq(10)
      end
    end

    context "helper methods return false" do
      it "does not identify a straight flush" do
        expect(random_hand.is_straight_flush?).to be false
      end
      it "does not identify a four of a kind" do
        expect(random_hand.is_four_of_a_kind?).to be false
      end
      it "does not identify a full house" do
        expect(random_hand.is_full_house?).to be false
      end
      it "does not identify a flush" do
        expect(random_hand.is_flush?).to be false
      end
      it "does not identify a straight" do
        expect(random_hand.is_straight?).to be false
      end
      it "does not identify a three of a kind" do
        expect(random_hand.is_three_of_a_kind?).to be false
      end
      it "does not identify a two pair" do
        expect(random_hand.is_two_pair?).to be false
      end
      it "does not identify a one pair" do
        expect(random_hand.is_one_pair?).to be false
      end
    end
  end

  describe "#beats_hand?" do

    it "returns true that a straight flush beats a four of a kind" do
      expect(straight_flush.beats_hand?(four_of_a_kind)).to be true
    end

  end

end
