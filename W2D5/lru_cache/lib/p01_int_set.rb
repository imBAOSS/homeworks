class MaxIntSet
  def initialize(max)
    @stack = Array.new(max + 1)
    @size = max
  end

  def insert(num)
    raise "Out of bounds" unless num.between?(0, @size)
    @stack << num
  end

  def remove(num)
    @stack.delete(num)
  end

  def include?(num)
    @stack.include?(num)
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store << num
  end

  def remove(num)
    @store.delete(num)
  end

  def include?(num)
    @store.include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == @store.length
    @store[num % num_buckets] << num
    @count += 1
  end

  def remove(num)
    @store.each do |bucket|
      bucket.delete(num) if bucket.include?(num)
    end
    @count -= 1
  end

  def include?(num)
    @store.each do |bucket|
      return true if bucket.include?(num)
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    store = Array.new(@count * 2) { Array.new }
    @store.each do |bucket|
      bucket.each do |item|
        store[item % (num_buckets * 2)] << item
      end
    end

    @store = store
  end
end
