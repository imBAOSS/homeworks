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
    @name = "B"
    super
  end

  def moves
    moves_arr = SlidingPiece::moves(DIRS, @pos, @board, self)
  end
end
