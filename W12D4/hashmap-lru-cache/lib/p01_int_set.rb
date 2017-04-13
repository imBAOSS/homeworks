class MaxIntSet
  def initialize(max)
    @store = Array.new(max)
    @max = max
  end

  def insert(num)
    raise 'Out of bounds' if num > @max || num < 0
    @store << num
  end

  def remove(num)
    @store.delete(num)
  end

  def include?(num)
    @store.any? { |el| el == num }
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
    @store[num % num_buckets] << num
  end

  def remove(num)
    @store[num % num_buckets].delete(num)
  end

  def include?(num)
    @store.each do |bucket|
      bucket.each do |el|
        return true if num == el
      end
    end

    return false
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
    resize! if @count == num_buckets
    self[num] << num
    @count += 1
  end

  def remove(num)
    self[num].delete(num)
    @count -= 1
  end

  def include?(num)
    @store.each do |bucket|
      bucket.each do |el|
        return true if num == el
      end
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_arr = Array.new(num_buckets * 2) { Array.new }
    @store.each do |buckets|
      buckets.each do |num|
        new_arr[num % (num_buckets * 2)] << num
      end
    end

    @store = new_arr
  end
end
