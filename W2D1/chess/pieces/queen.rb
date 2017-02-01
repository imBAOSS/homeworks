require_relative "../modules/sliding_piece"
require_relative "../piece"

class Queen < Piece
  include SlidingPiece

  DIRS = [
    [1, 1],
    [1, -1],
    [-1, -1],
    [-1, 1],
    [1, 0],
    [0, 1],
    [-1, 0],
    [0, -1]
  ]

  def initialize(pos, board, color)
    @name = (color == :white) ? "\u2655" : "\u265B"
    @name = @name.encode("utf-8")
    super
  end

  def moves
    moves_arr = SlidingPiece::moves(DIRS, @pos, @board, self)
  end
end
