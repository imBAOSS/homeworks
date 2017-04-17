require_relative "heap"

class Array
  def heap_sort!
    heap = BinaryMinHeap.new
    self.each { |num| heap.push(num) }
    self.each_index do |i|
      self[i] = heap.extract
    end

    self
  end
end
