class Stack
  attr_reader :ivar

  def initialize
    # create ivar to store stack here!
    @ivar = []
  end

  def add(el)
    # adds an element to the stack
    @ivar << el
  end

  def remove
    # removes one element from the stack
    @ivar.pop
  end

  def show
    # return a copy of the stack
    @ivar
  end
end

class Queue
  attr_reader :ivar

  def initialize
    @ivar = []
  end

  def enqueue(el)
    @ivar << el
  end

  def dequeue
    @ivar.shift
  end

  def show
    @ivar
  end

end

class Map
  attr_accessor :ivar

  def initialize
    @ivar = []
  end

  def assign(key, value)
    @ivar.each do |k, v|
      if key == k
        @ivar[@ivar.index([k, v])] = [k, value]
      else
        @ivar << [key, value]
      end
    end
    @ivar
  end

  def lookup(key)
    @ivar.each do |k, v|
      return [k, v] if k == key
    end
    nil
  end

  def remove(key)
    @ivar.each do |k, v|
      i = @ivar.index([k, v])
      @ivar.delete_at(i) if k == key
    end
  end

  def show
    @ivar
  end

end
