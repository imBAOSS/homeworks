require_relative "../modules/stepping_piece"
require_relative "../piece"

class Knight < Piece
  include SteppingPiece

  DELTAS = [
    [-2, 1],
    [-2, -1],
    [-1, 2],
    [-1, -2],
    [1, 2],
    [2, -1],
    [2, 1],
    [1, -2]
  ]

  def initialize(pos, board, color)
    @name = (color == :white) ? "\u2658" : "\u265E"
    @name = @name.encode("utf-8")
    super
  end

  def moves
    moves_arr = SteppingPiece::moves(DELTAS, @pos, @board, self)
  end
end
