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
    @name = "N"
    super
  end

  def moves
    moves_arr = SteppingPiece::moves(DELTAS, @pos, @board, self)
  end
end
