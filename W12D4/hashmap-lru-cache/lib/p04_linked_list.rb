class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @next.prev = @prev
    @prev.next = @next
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each { |link| return link.val if link.key == key }
    nil
  end

  def include?(key)
    self.each { |link| return true if link.key == key }
    false
  end

  def append(key, val)
    link = Link.new(key, val)
    last_link = @tail
    link.next = last_link
    link.prev = last_link.prev
    last_link.prev.next = link
    last_link.prev = link
  end

  def update(key, val)
    self.each { |link| link.val = val if link.key == key }
  end

  def remove(key)
    self.each do |link|
      link.remove if link.key == key
    end
  end

  def each
    link = self.first
    until link == @tail
      yield(link)
      link = link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
