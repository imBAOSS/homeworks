require 'exercises'

describe Array do

  describe "#my_uniq" do

    let(:original) { [1, 2, 3, 3] }

    it "returns an empty array if no elements in array" do
      expect([].my_uniq).to be_empty
    end

    it "does not modify the original" do
      duped_array = original.dup
      duped_array.my_uniq
      expect(duped_array).to eq(original)
    end

    it "returns an identical array if no duplicates" do
      expect([1, 2, 3].my_uniq).to eq([1, 2, 3])
    end

    it "removes duplicates" do
      expect(original.my_uniq).to eq(original.uniq)
    end

    it "does not call Array#uniq" do
      expect(original).to_not receive(:uniq)
      original.my_uniq
    end
  end

  describe "#two_sum" do
    it "returns an empty array if no pairs of elements sum to zero" do
      expect([-1, 2, -3, 4].two_sum).to eq([])
    end

    it "returns correct pairs" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end

    it "returns an empty array if called on an empty array" do
      expect([].two_sum).to eq([])
    end

    it "does not return pairs from the same index" do
      expect([2, 0, -4].two_sum).to_not include([1, 1])
    end

  end

  describe "#my_transpose" do

    let(:square_array) { [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ] }

    let(:rect_array_1) { [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [2, 4, 9]
    ] }

    let(:rect_array_2) { [
      [0, 1, 2, 9],
      [3, 4, 5, 10],
      [6, 7, 8, 11]
    ] }

    it "transposes a 'square' 2D array" do
      expect(square_array.my_transpose).to eq(square_array.transpose)
    end

    context "with a 'rectangular' 2D array" do

      it "transposes a 2D array with height > width" do
        expect(rect_array_1.my_transpose).to eq(rect_array_1.transpose)
      end

      it "transposes a 2D array with height < width" do
        expect(rect_array_2.my_transpose).to eq(rect_array_2.transpose)
      end

    end

    it "returns an empty array when called on an empty array" do
      expect([[]].my_transpose).to eq([])
    end

    it "does not modify the original array" do
      duped_array = square_array.dup
      duped_array.my_transpose
      expect(duped_array).to eq(square_array)
    end

    it "does not call Array#transpose" do
      expect(square_array).to_not receive(:transpose)
      square_array.my_transpose
    end

    it "raises error if called on a 1D array" do
      expect{ [1, 2, 3].my_transpose }.to raise_error("can't call on a 1D array")
    end
  end
end

describe "#stock_picker" do
  let(:week_1) { [1, 2, 3, 4, 5] }
  let(:week_2) { [5, 4, 3, 2, 1] }
  let(:week_3) { [0, -5, 5, 3, -4] }

  it "returns expected day" do
    expect(stock_picker(week_1)).to eq([0, 4])
  end

  it "raises error if called on an array with only 1 day" do
    expect { stock_picker([1]) }.to raise_error("Only one day!")
  end

  it "returns no days if there no days with profit" do
    expect(stock_picker(week_2)).to eq([])
  end

  it "does not return a pair where day bought is after day sold" do
    expect(stock_picker(week_2)).to_not eq([4, 0])
  end
end
