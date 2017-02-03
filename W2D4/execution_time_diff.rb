def my_min_1(array)
  array.each do |num|
    return num if array.all? { |num2| num <= num2 }
  end
end

def my_min_2(array)
  smallest_num = nil
  array.each do |num|
    smallest_num = num if smallest_num.nil? || num < smallest_num
  end

  smallest_num
end

array = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min_1(array) == -5
p "-------------------"
p my_min_2(array) == -5

def largest_contiguous_1(array) # n^3
  result = []

  (0...array.length).each do |i|
    (i...array.length).each do |j|
      result << array[i..j]
    end
  end

  result.map do |sub_array|
    sub_array.inject(:+)
  end.max
end

def largest_contiguous_2(array)
  highest_sum = 0
  current_sum = 0

  array.each do |el|

    current_sum += el
    highest_sum = current_sum if highest_sum < current_sum
  end

  highest_sum
end

list1 = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]
p "-------------------"
p largest_contiguous_1(list1) == 8
p largest_contiguous_1(list2) == 8
p largest_contiguous_1(list3) == -1
p "-------------------"
p largest_contiguous_2(list1) == 8
p largest_contiguous_2(list2) == 8
p largest_contiguous_2(list3) == -1
