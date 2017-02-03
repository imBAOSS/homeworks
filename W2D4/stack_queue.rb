class MyQueue

  def initialize
    @store = []
  end

  def enqueue(next_item)
    @store.push(next_item)
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

end

class MyStack
  # attr_reader :max, :min

  def initialize
    @max = nil
    @min = nil
    @store = []
  end

  def push(next_item)
    @max = next_item if @max.nil? || @max < next_item
    @min = next_item if @min.nil? || @min > next_item
    @store.push(next_item)
  end

  def pop
    @store.pop
  end

  def peek
    @store.first
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

end

class StackQueue
  attr_reader :max, :min

  def initialize
    @max = nil
    @min = nil
    @stack_one = MyStack.new
    @stack_two = MyStack.new
  end

  def enqueue(element)
    @max = element if @max.nil? || @max < element
    @min = element if @min.nil? || @min > element

    if @stack_two.empty?
      until @stack_one.empty?
        @stack_two.push(@stack_one.pop)
      end
    end

    @stack_two.push(element)
  end

  def dequeue
    if @stack_one.empty?
      until @stack_two.empty?
        @stack_one.push(@stack_two.pop)
      end
    end

    @stack_one.pop
  end

  def size
    @stack_one.size + @stack_two.size
  end

  def empty?
    @stack_one.empty? && @stack_two.empty?
  end

end
