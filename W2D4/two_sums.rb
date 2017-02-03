require "set"

def bad_two_sums?(arr, target) # n^2
  arr.combination(2).to_a.any? { |pair| pair.reduce(:+) == target }

  # (0...arr.length - 1).each do |i|
  #   (i + 1...arr.length).each do |j|
  #     return true if arr[i][j] == target
  #   end
  # end
  # false
end

arr = [0, 1, 5, 7]
p bad_two_sums?(arr, 6) == true # => should be true
p bad_two_sums?(arr, 10) == false # => should be false

def okay_two_sums?(arr, target)
  arr.sort!

  arr.each do |num|
    return true if b_search?(arr, (target - num))
  end
  false
end

def b_search?(arr, target)
  return nil if arr.empty?
  mid = arr.length / 2
  case target <=> mid
  when -1
    b_search?(arr.take(mid), target)
  when 0
    mid
  when 1
    right = b_search?(arr.drop(mid + 1), target)
    right.nil? ? nil : (mid + 1) + right
  end
end

p okay_two_sums?(arr, 6) == true # => should be true
p okay_two_sums?(arr, 10) == false # => should be false

def two_sums?(arr, target)
  # number_count = Hash.new(0)
  #
  # arr.each do |num|
  #   number_count[num] += 1
  # end
  #
  # arr.each do |num|
  #   other_num = target - num
  #   number_count[num] -= 1
  #   return true if number_count.include?(other_num) && number_count[other_num] > 0
  # end
  #
  # false
  set = Set.new(arr)
  arr.each do |num|
    set.delete(num)
    return true if set.include?(target - num)
  end
  false
end

arr2 = [0, 1, 5, 5, 7]

p two_sums?(arr, 6) == true # => should be true
p two_sums?(arr, 10) == false # => should be false
