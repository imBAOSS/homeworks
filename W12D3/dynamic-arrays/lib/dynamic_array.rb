require_relative "static_array"

class DynamicArray
  include Enumerable
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @capacity = 8
    @length = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    @store[index] = value
  end

  # O(1)
  def pop
    raise 'index out of bounds' if @length.zero?
    @length -= 1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    if @length == @capacity
      resize!
    end

    @store[@length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    raise 'index out of bounds' if @length.zero?
    shifted = @store[0]
    new_arr = StaticArray.new(@capacity)

    i = 0
    while i < @length
      new_arr[i] = @store[i + 1]
      i += 1
    end

    @length -= 1
    @store = new_arr

    shifted
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    if @length == @capacity
      resize!
    end
    new_arr = StaticArray.new(@capacity)
    new_arr[0] = val

    i = 0
    while i < @length
      new_arr[i + 1] = @store[i]
      i += 1
    end

    @length += 1
    @store = new_arr
  end

  def each
    i = 0
    while i < @length
      yield(@store[i])
      i += 1
    end
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise 'index out of bounds' if index > @length - 1
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_arr = StaticArray.new(@capacity * 2)
    self.each_with_index do |el, i|
      new_arr[i] = el
    end
    @capacity *= 2
    @store = new_arr
  end
end
