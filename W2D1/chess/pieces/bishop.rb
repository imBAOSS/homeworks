require_relative "../modules/sliding_piece"
require_relative "../piece"

class Bishop < Piece
  include SlidingPiece

  DIRS = [
    [1, 1],
    [1, -1],
    [-1, -1],
    [-1, 1]
  ]

  def initialize(pos, board, color)
    @name = (color == :white) ? "\u2657" : "\u265D"
    @name = @name.encode("utf-8")
    super
  end

  def moves
    moves_arr = SlidingPiece::moves(DIRS, @pos, @board, self)
  end
end
