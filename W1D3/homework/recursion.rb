def sum_to(n)
  return 1 if n == 1
  return nil if n < 0

  n + sum_to(n - 1)
end

# Test Cases
p sum_to(5)  # => returns 15
p sum_to(1)  # => returns 1
p sum_to(9)  # => returns 45
p sum_to(-8)  # => returns nil

def add_numbers(nums_array)
  return nums_array[0] if nums_array.length == 1
  return nil if nums_array.empty?

  nums_array[0] + add_numbers(nums_array[1..-1])
end

# Test Cases
p add_numbers([1,2,3,4]) # => returns 10
p add_numbers([3]) # => returns 3
p add_numbers([-80,34,7]) # => returns -39
p add_numbers([]) # => returns nil

def gamma_fnc(n)
  return 1 if n == 1
  return nil if n.zero?

  (n - 1) * gamma_fnc(n - 1)
end

# Test Cases
p gamma_fnc(0)  # => returns nil
p gamma_fnc(1)  # => returns 1
p gamma_fnc(4)  # => returns 6
p gamma_fnc(8)  # => returns 5040
