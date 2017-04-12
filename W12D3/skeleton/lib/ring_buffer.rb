require_relative "static_array"
require 'byebug'

class RingBuffer
  include Enumerable

  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @length = 0
    @start_idx = 0
    @capacity = 8
  end

  # O(1)
  def [](index)
    check_index(index)
    idx = (@start_idx + index) % @capacity
    @store[idx]
  end

  # O(1)
  def []=(index, val)
    idx = (@start_idx + index) % @capacity
    @store[idx] = val
  end

  # O(1)
  def pop
    raise 'index out of bounds' if @length.zero?
    last_idx = (@start_idx + @length) % @capacity - 1
    popped = @store[last_idx]
    @length -= 1
    popped
  end

  # O(1) ammortized
  def push(val)
    resize! if @length == @capacity

    new_idx = (@start_idx + @length) % @capacity

    @store[new_idx] = val
    @length += 1
  end

  # O(1)
  def shift
    check_index((@start_idx + @length) % @capacity)
    shifted = @store[@start_idx]
    @start_idx = (@start_idx + 1) % @capacity
    @length -= 1
    shifted
  end

  # O(1) ammortized
  def unshift(val)
    resize! if @length == @capacity
    @start_idx = (@start_idx - 1) % @capacity
    @store[@start_idx] = val
    @length += 1
  end

  def each
    i = 0
    while i < @length
      yield(@store[i])
      i += 1
    end
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise 'index out of bounds' if index > @length - 1 || @length.zero?
  end

  def resize!
    new_arr = StaticArray.new(@capacity * 2)

    new_start_idx = @start_idx + @capacity


    (0...@length).each do |i|
      idx = (new_start_idx + i) % (@capacity  * 2)
      old_idx = (@start_idx + i) % @capacity
      new_arr[idx] = @store[old_idx]
    end

    @start_idx = new_start_idx

    @capacity *= 2
    @store = new_arr
  end
end
