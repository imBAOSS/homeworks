def range(start, finish)
  return [] if finish < start
  return [finish] if start == finish

  [start] + range(start + 1, finish)
end

p "range Test Cases"
p range(2, 7) == (2..7).to_a

def rsum(arr)
  return 0 if arr.empty?
  return arr.first if arr.length == 1
  arr.first + rsum(arr[1..-1])
end

p "rsum Test Cases"
p rsum([]) == 0
p rsum([2]) == 2
p rsum([1,2]) == 3

def isum(arr)
  arr.reduce(0,:+)
end

p "isum Test Cases"
p isum([]) == 0
p isum([2]) == 2
p isum([1,2]) == 3

def exp1(base, exp)
  return 1 if exp == 0

  base * exp1(base, exp - 1)
end

p "exp1 Test Cases"
p exp1(4, 0) == 1
p exp1(4, 1) == 4
p exp1(3, 2) == 9

def exp2(base, exp)
  return 1 if exp == 0
  return base if exp == 1

  if exp.even?
    value = exp2(base, exp / 2)
  else
    value = base * exp2(base, (exp - 1) / 2)
  end
  value * value
end

p "exp2 Test Cases"
p exp2(4, 0) == 1
p exp2(4, 1) == 4
p exp2(3, 2) == 9

class Array

  def deep_dup
    clone = []

    self.each do |el|
      clone << (el.is_a?(Array) ? el.deep_dup : el)
    end

    clone
  end

end

p "deep_dup Test Cases"
p [].deep_dup == []
p [1, 2, 3].deep_dup == [1, 2, 3]
p [1, [2, 3, 4], 5].deep_dup == [1, [2, 3, 4], 5]

def rfib(n, memo = {})
  return 1 if n <= 1

  memo[n] ||= rfib(n - 2, memo) + rfib(n - 1, memo)
end

p "rfib Test Cases"
p rfib(0) == 1
p rfib(1) == 1
p rfib(2) == 2
p rfib(3) == 3
p rfib(4) == 5

def ifib(n)
  fib = [1, 1]
  return fib[n] if n <= 1

  while fib.length <= n
    fib << fib[-2] + fib[-1]
  end

  fib.last
end

p "ifib Test Cases"
p ifib(0) == 1
p ifib(1) == 1
p ifib(2) == 2
p ifib(3) == 3
p ifib(4) == 5

# class Array
#
#   def subsets
#     return [[]] if self.empty?
#     sets = [self]
#     sets << self[1..-1].subsets
#   end
#
# end
class Array

  def subsets
    return [[]] if self.empty?

    sets = self.take(self.count - 1).subsets
    sets.concat( sets.map { |set| set + [self.last]} )
  end

end

p "subsets Test Cases"
p [].subsets # => [[]]
p [1].subsets # => [[], [1]]
p [1, 2].subsets # => [[], [1], [2], [1, 2]]
p [1, 2, 3].subsets
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
p [1, 2, 3, 4].subsets


# def  permutations(arr)
#   return arr if arr.size < 2
#
#   almost_results = []
#
#   arr.each_index do |i|
#     perms = arr.dup
#     almost_results << [perms.delete_at(i)] + permutations(perms)
#   end
#
#   results = []
#   almost_results.each.with_index do |res, i|
#     first_el = res[0]
#     res.each.with_index do |ress, j|
#       next if j == 0
#       results << [first_el] + [ress]
#     end
#   end
#   results.map(&:flatten)
# end

def permutations(array)
  return [array] if array.length <= 1

  first = array.shift
  perms = permutations(array)
  total_permutations = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      total_permutations << perm[0 ... i] + [first] + perm[i .. -1]
    end
  end
  total_permutations
end

def merge_sort(arr)
  return arr if arr.size < 2

  mid = arr.size / 2
  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..-1])
  _merge_sort(left, right)
end

def _merge_sort(left, right)
  sorted = []
  until left.empty? || right.empty?
    sorted << (left.first < right.first ? left.shift : right.shift)
  end
  sorted + left + right
end

def bsearch(array, target)
  mid = array.size / 2
  mid_value = array[mid]
  return nil if mid_value.nil?
  return mid if target == mid_value

  if target < mid_value
    bsearch(array[0...mid], target)
  else
    num = bsearch(array[mid + 1..-1], target)
    return nil if num.nil?

    num + mid + 1
  end

end

p "bsearch Test Cases"
p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def greedy_make_change(amount, coins = [25, 10, 5, 1])
  return [] if coins.min > amount

  max_coin = coins.select { |coin| coin <= amount }.max
  [max_coin] + greedy_make_change(amount - max_coin, coins)
end

p "greedy_make_change Test Cases"
p greedy_make_change(39) == [25, 10, 1, 1, 1, 1]
p greedy_make_change(24, [10, 7, 1]) == [10, 10, 1, 1, 1, 1]

# def better_make_change(amount, coins = [25, 10, 5, 1])
#   return [] if amount <= coins.min
#
#   coins.each do |coin|
#     lesser_coins = coins.select { |lcoin| lcoin <= coin && lcoin <= amount}
#     [coin] + better_make_change(amount - coin, lesser_coins)
#   end
#
#   # coin_combos.sort{ |c1, c2| c1.length - c2.length }.first
# end

def better_make_change(amount, coins = [25, 10, 5, 1])
  return [] if amount < coins.min

  coin_combos = []

  coins.each do |coin|
    lesser_coins = coins.select { |lcoin| lcoin <= coin && lcoin <= amount}
    selected_coin = lesser_coins.max
    coin_combos << [selected_coin] + better_make_change(amount - selected_coin, lesser_coins)
  end

  coin_combos.sort{ |c1, c2| c1.length - c2.length }.first
end

p "better_make_change Test Cases"
p better_make_change(24, [10, 7, 1]) == [10, 7, 7]
p better_make_change(25, [10, 7, 1]) == [10, 7, 7, 1]
