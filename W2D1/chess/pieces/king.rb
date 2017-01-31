require_relative "../modules/stepping_piece"
require_relative "../piece"

class King < Piece
  include SteppingPiece

  DELTAS = [[-1, -1], [-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1]]

  def initialize(pos, board, color)
    @name = "K"
    super
  end

  def moves
    moves_arr = SteppingPiece::moves(DELTAS, @pos, @board, self)
  end


end
