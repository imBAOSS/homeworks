class LRUCache
  def initialize(size)
    @size = size
    @stack = Array.new(size)
  end

  def count
    # returns number of elements currently in cache
    @stack.count
  end

  def add(el)
    # adds element to cache according to LRU principle
    if @stack.include?(el)
      @stack.delete(el)
    elsif count >= size
      @stack.shift
    end

    @stack << el
  end

  def show
    # shows the items in the cache, with the LRU item first
    @stack
  end
end
