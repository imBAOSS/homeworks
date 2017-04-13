require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if num_buckets == @count
    @store[key.hash % num_buckets] << key
    @count += 1
  end

  def include?(key)
    @store.each do |bucket|
      bucket.each do |el|
        return true if el == key
      end
    end
    false
  end

  def remove(key)
    self.include?(key)
    @store.delete(@store[key.hash % num_buckets])
    @count -= 1
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_set = Array.new(num_buckets * 2) { Array.new }

    @store.each do |bucket|
      bucket.each do |el|
        new_set[el.hash % (num_buckets * 2)] << el
      end
    end

    @store = new_set
  end
end
