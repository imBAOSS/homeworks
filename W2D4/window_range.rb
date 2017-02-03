require_relative 'stack_queue'

def windowed_max_range(array, window_size)
  result = []

  array.each_cons(window_size) do |arr|
    result << arr.max - arr.min
  end

  result.max
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

def optimized_max_range(array, window_size)
  stack = StackQueue.new
  highest_difference = nil

  until stack.size == window_size
    stack.enqueue(array.shift)
  end

  until array.empty?
    if highest_difference.nil? || (stack.max - stack.min) > highest_difference
      highest_difference = stack.max - stack.min
    end

    stack.dequeue
    stack.enqueue(array.shift)
  end

  if (stack.max - stack.min) > highest_difference
    highest_difference = stack.max - stack.min
  end

  highest_difference
end

p optimized_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p optimized_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p optimized_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p optimized_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
