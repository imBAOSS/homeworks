require 'towers_of_hanoi'

describe TowersOfHanoi do

  subject(:three_disks) { TowersOfHanoi.new }

  describe "#initialize" do

    let(:five_disks) { TowersOfHanoi.new(5) }

    it "initializes with three disks as a default" do
      expect(three_disks.num_disks).to eq(3)
    end

    it "initializes with five disks" do
      expect(five_disks.num_disks).to eq(5)
    end

    it "creates a towers array of length three" do
      expect(three_disks.towers.length).to eq(3)
      expect(five_disks.towers.length).to eq(3)
    end

    it "populates middle tower with correct number of disks in order" do
      expect(three_disks.towers).to eq([[], [3,2,1], []])
      expect(five_disks.towers).to eq([[], [5,4,3,2,1], []])
    end

  end

  describe "#move" do

    it "won't move a disk from an empty tower" do
      expect{ three_disks.move(0, 2) }.to raise_error("Can't move from an empty tower")
    end

    it "won't put a larger disk onto a smaller disk" do
      three_disks.move(1, 0)
      expect { three_disks.move(1, 0) }.to raise_error("Can't stack a larger disk onto a smaller disk")
    end

    it "will move a smaller disk onto a larger disk" do
      three_disks.move(1, 0)
      three_disks.move(1, 2)
      expect { three_disks.move(0, 2) }.to_not raise_error
    end

    it "will not move to the same tower" do
      expect { three_disks.move(1, 1) }.to raise_error("Can't move onto the same tower!")
    end

    it "will not invalid towers" do
      expect { three_disks.move(1, 3) }.to raise_error("Tower does not exist!")
    end

  end

  describe "#won" do
    let(:left_moves) { [[1,0], [1,2], [0,2], [1,0], [2,1], [2,0], [1,0]] }
    let(:right_moves) { [[1,2], [1,0], [2,0], [1,2], [0,1], [0,2], [1,2]] }

    it "returns false unless all disks are stacked on a non-center tower" do
      expect(three_disks.won?).to be false
    end

    it "returns true if all disks are stacked on left tower" do
      left_moves.each { |move| three_disks.move(*move) }
      expect(three_disks.won?).to be true
    end

    it "returns true if all disks are stacked on right tower" do
      right_moves.each { |move| three_disks.move(*move) }
      expect(three_disks.won?).to be true
    end

  end

end
