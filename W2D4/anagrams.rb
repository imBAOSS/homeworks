def first_anagram?(string_one, string_two)
  string_one.chars.permutation.map(&:join).include?(string_two)
end

p first_anagram?("gizmos", "gizmol") == false    #=> false
p first_anagram?("elvis", "lives") == true    #=> true

def second_anagram?(string_one, string_two)
  arr_1 = string_one.chars
  arr_2 = string_two.chars

  arr_1.length.times do |i|
    if arr_2.include?(arr_1[i])
      arr_2.delete_at(arr_2.index(arr_1[i]))
      arr_1[i] = []
    end
  end
    arr_2.flatten.empty? || arr_2.flatten.empty?

end

p second_anagram?("gizmos", "gizmol") == false    #=> false
p second_anagram?("elvis", "lives") == true    #=> true

def third_anagram?(string_one, string_two)
  string_one.chars.sort == string_two.chars.sort
end

p third_anagram?("gizmos", "gizmol") == false    #=> false
p third_anagram?("elvis", "lives") == true    #=> true

def fourth_anagram?(string_one, string_two)
  hash = Hash.new(0)

  string_one.each_char do |char|
    hash[char] += 1
  end

  string_two.each_char do |char|
    hash[char] -= 1
  end

  # return false unless string_one.length == string_two.length
  #
  # (0..string_one.length).each do |index|
  #   hash[string_one[index]] += 1
  #   hash[string_two[index]] -= 1
  # end

  hash.values.all? { |num| num.zero? }
end

p fourth_anagram?("gizmos", "gizmol") == false    #=> false
p fourth_anagram?("elvis", "lives") == true    #=> true
