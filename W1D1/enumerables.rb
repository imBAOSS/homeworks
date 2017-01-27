require 'byebug'

class Array

  def my_each(&blk)
    self.each_index { |i| yield(self[i])}
  end

  def my_select(&blk)
    result = []
    self.my_each { |el| result << el if yield(el) }
    result
  end

  def my_reject(&blk)
    result = []
    self.each { |el| result << el unless yield(el) }
    result
  end

  def my_any?(&blk)
    self.each { |el| return true if yield(el) }

    false
  end


  def my_all?(&blk)
    self.each { |el| return false unless yield(el) }

    true
  end

  def my_flatten(flatten = [])

    self.each do |el|
      if el.is_a?(Array)
        el.my_flatten(flatten)
      else
        flatten.push(el)
      end
    end

    flatten
  end

  def my_zip(*arr)

    new_arr = []

    new_arr << self

    arr.each do |a|
      if a.length < self.length
        a << nil until a.length == self.length
      elsif self.length < a.length
        a = a[0...self.length]
      end
      new_arr << a
    end

    new_arr.transpose

  end

  def my_reverse
    reverse = []
    idx = self.length - 1
    while idx >= 0
      reverse << self[idx]
      idx -= 1
    end

    reverse

    # reverse = []
    # self.each { |el| reverse.unshift(el) }
    # reverse
  end

  def my_rotate(shift = 1)
    shift = shift % self.length

    self.drop(shift) + self.take(shift)
  end

  def my_join(separator = "")
    result = ""
    self.each { |el| result << el + separator }
    result[0..-2]
  end

end
