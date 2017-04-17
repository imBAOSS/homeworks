require 'byebug'

class BinaryMinHeap
  def initialize(&prc)
    @prc ||= Proc.new { |a, b| a <=> b }
    @store = []
  end

  def count
  end

  def extract
    @store[0], @store[-1] = @store[-1], @store[0]
    val = @store.pop
    BinaryMinHeap.heapify_down(@store, 0)
    val
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    child_idx = @store.length - 1
    BinaryMinHeap.heapify_up(@store, child_idx)
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_index)
    first = 2*parent_index + 1
    second = 2*parent_index + 2
    [first, second].select { |num| num < len }
  end

  def self.parent_index(child_index)
    raise 'root has no parent' if child_index.zero?
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }
    heapify = true
    children = BinaryMinHeap.child_indices(len, parent_idx)

    until children.empty?

      if children.length == 1
        if BinaryMinHeap.compare(array, parent_idx, children[0], &prc) > 0
          array[parent_idx], array[children[0]] = array[children[0]], array[parent_idx]
          parent_idx = children[0]
        else
          parent_idx = children[0]
        end
      else
        if BinaryMinHeap.compare(array, children[0], children[1], &prc) < 0
          array[parent_idx], array[children[0]] = array[children[0]], array[parent_idx]
          parent_idx = children[0]
        else
          array[parent_idx], array[children[1]] = array[children[1]], array[parent_idx]
          parent_idx = children[1]
        end
      end


      children = BinaryMinHeap.child_indices(len, parent_idx)
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return array if array.length <= 1 || child_idx.zero?
    parent_idx = (child_idx - 1) / 2
    prc ||= Proc.new { |a, b| a <=> b }
    val = prc.call(array[parent_idx], array[child_idx])
    # debugger

    until  val == -1
      if val > 0
        array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]
        child_idx = parent_idx unless parent_idx.zero?
      end

      parent_idx = (child_idx - 1) / 2
      val = prc.call(array[parent_idx], array[child_idx])
    end
    array
  end

  private

  def self.compare(array, parent_idx, child_idx, &prc)
    prc ||= Proc.new { |a, b| a <=> b }

    prc.call(array[parent_idx], array[child_idx])
  end
end
