class Player
  attr_reader :name, :color

  def initialize(name = "Bob", color, game)
    @name = name
    @color = color
    @game = game
    @board = game.board
    @display = game.display
  end

end
