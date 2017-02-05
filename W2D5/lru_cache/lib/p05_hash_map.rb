require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count

  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    pail = bucket(key)
    if include?(key)
      pail.update(key, val)
    else
      resize! if @count == num_buckets
      pail.append(key, val)
      @count += 1
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    if include?(key)
      bucket(key).remove(key)
      @count -= 1
    end
  end

  def each
    @store.each do |bucket|
      bucket.each do |link|
        yield(link.key, link.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    # new_map = HashMap.new(num_buckets * 2)
    # each do |key, val|
    #   new_map.set(key,val)
    # end
    # @store = new_map.store
    store = Array.new(num_buckets * 2) { LinkedList.new }
    each do |key, val|
      store[key.hash % (num_buckets * 2)].append(key, val)
    end
    @store = store
  end

  def bucket(key)
    @store[key.hash % num_buckets]
  end
end
