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
    @prev.next = @next
    @next.prev = @prev
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
    each { |link| return link.val if link.key == key }
  end

  def include?(key)
    each { |link| return true if link.key == key }
    false
  end

  def append(key, val)
    new_link = Link.new(key, val)
    new_link.prev = @tail.prev
    new_link.next = @tail
    @tail.prev.next = new_link
    @tail.prev = new_link
  end

  def update(key, val)
    each { |link| return link.val = val if link.key == key }
  end

  def remove(key)
    each { |link| link.remove if link.key == key }
  end

  def each
    link = first
    until link == @tail
      yield(link)
      link = link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
