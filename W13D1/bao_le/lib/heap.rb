require 'byebug'

class BinaryMinHeap
  def initialize(&prc)
    @prc ||= Proc.new { |a, b| a <=> b }
  end

  def count
  end

  def extract
  end

  def peek
  end

  def push(val)
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

    while heapify
      heapify = false
      child_idx = BinaryMinHeap.child_indices(len, parent_idx)

      if !child_idx.empty? && (prc.call(array[parent_idx], array[child_idx[0]]) > 0 && prc.call(array[child_idx[0]], array[child_idx[1]]) < 0)
        array[parent_idx], array[child_idx[0]] = array[child_idx[0]], array[parent_idx]
        parent_idx = child_idx[0]
        heapify = true
      elsif !child_idx.empty? && (prc.call(array[parent_idx], array[child_idx[1]]) > 0 && prc.call(array[child_idx[1]], array[child_idx[0]]) < 0)
        array[parent_idx], array[child_idx[1]] = array[child_idx[1]], array[parent_idx]
        parent_idx = child_idx[1]
        heapify = true
      end
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
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
end
