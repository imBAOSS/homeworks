class HumanPlayer
  attr_accessor :name, :matches

  def initialize(name)
    @name = name
    @matches = 0
  end

  def get_guess
    gets.chomp.scan(/\d/).map { |num| num.to_i - 1 }
  end
end
