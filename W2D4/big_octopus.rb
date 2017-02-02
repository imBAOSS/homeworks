def sluggish_octopus(array)
  longest_fish = ""
  longest_fish_count = 0
  array.each do |fish|
    letter_count = 0
    fish.chars.each do |letter|
      letter_count += 1
    end
    longest_fish = fish if letter_count > longest_fish_count
  end

  longest_fish
end

def dominant_octopus(array)
  merge_sort(array).last
end

def merge_sort(array)
  return array if array.length <= 1
  mid = array.length / 2
  left = merge_sort(array[0...mid])
  right = merge_sort(array[mid..-1])

  merge(left, right)
end

def merge(left, right)
  sorted = []

  until left.empty? || right.empty?
    sorted << (left.first.length < right.first.length ? left.shift : right.shift)
  end

  sorted + left + right
end

def clever_octopus(array)
  longest_fish = ""
  array.each { |fish| longest_fish = fish if fish.length > longest_fish.length }
  longest_fish
end

def slow_dance(direction, tiles_array)
  tiles_array.each.with_index { |dir, i| return i if dir == direction }
end

def constant_dance(direction, hash)
  hash[direction]
end


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

dir_hash = Hash.new
tiles_array.each.with_index { |dir, i| dir_hash[dir] = i }

array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

p "----sluggish_octopus----"
p sluggish_octopus(array) == "fiiiissshhhhhh"
print "\n"
p "----dominant octopus----"
p dominant_octopus(array) == "fiiiissshhhhhh"
print "\n"
p "----dominant octopus----"
p clever_octopus(array) == "fiiiissshhhhhh"
