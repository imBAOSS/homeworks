require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      update_link!(@store.remove(key))
    else
      eject! if @max == count
      calc!(key)
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    val = @prc.call(key)
    @map[key] = @store.append(key, val)
    val
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
    @map.delete(link.key)
    @map[link.key] = @store.append(link.key, link.val)
  end

  def eject!
    oldest = @store.first
    @map.delete(oldest.key)
    @store.remove(oldest.key)
  end
end
