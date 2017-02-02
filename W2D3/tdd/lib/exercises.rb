class Array

  def my_uniq
    uniqs = []
    self.each { |el| uniqs << el unless uniqs.include?(el) }
    uniqs
  end

  def two_sum
    # seen = Hash.new { |h, k| h[k] = [] }
    # pairs = []
    # each_with_index do |el, i|
    #   if seen.key?(0-el)
    #     seen[0-el].each { |j| pairs << [j, i] }
    #   end
    #   seen[el] << i
    # end
    # pairs.sort_by { |el| el[0] }

    pairs = []
    (0...self.length - 1).each do |i|
      (i+1...self.length).each do |j|
        pairs << [i, j] if self[i] + self[j] == 0
      end
    end
    pairs
  end

  def my_transpose
    raise "can't call on a 1D array" unless self[0].is_a? (Array)

    transposed = []
    (0...self[0].length).each do |i|
      arr = []
      (0...self.length).each do |j|
        arr << self[j][i]
      end
      transposed << arr
    end
    transposed
  end

end

def stock_picker(stock_prices)
  raise "Only one day!" if stock_prices.length < 2

  lowest_price_seen = stock_prices[0]
  max_profit = stock_prices[1] - stock_prices[0]
  buy_on = 0
  sell_on = 1

  (1...stock_prices.length).each do |i|
    if stock_prices[i] < lowest_price_seen
      lowest_price_seen = stock_prices[i]
      buy_on = i
    end

    if stock_prices[i] - lowest_price_seen > max_profit
      max_profit = stock_prices[i] - lowest_price_seen
      sell_on = i
    end
  end

  buy_on > sell_on ? [] : [buy_on, sell_on]
end

a = [-1, 0, 2, -2, 1]
p a.two_sum
