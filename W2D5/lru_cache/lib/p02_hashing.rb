class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    arr = map { |el| el.hash }
    accumulator = 0
    arr.each_with_index do |num, i|
      accumulator += (i.even? ? accumulator - num ^ (num % (i + 1)) : accumulator + num ^ (i + 1))
    end
    accumulator
  end
end

class String
  def hash
    arr = chars.map(&:ord)
    arr.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    accumulator = 0
    to_a.each do |k, v|
      accumulator += k.hash - (v.hash + self.length ** 2)
    end

    accumulator
  end
end

class Symbol
  def hash
    to_s.hash
  end
end
