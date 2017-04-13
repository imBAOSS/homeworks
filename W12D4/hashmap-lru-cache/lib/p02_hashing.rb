class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    prehashed = self.map { |el| el.hash }
    val = 0

    prehashed.each_with_index do |num, idx|
      if num.even?
        val += (num % (idx + 1) + num)
      else
        val += (num % (idx + 1) - num)
      end
    end

    val
  end
end

class String
  def hash
    hashed = self.chars.map(&:ord)
    hashed.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    val = 0
    self.each_pair do |k,v|
      val += (k.hash + v.hash)
    end

    val
  end
end
