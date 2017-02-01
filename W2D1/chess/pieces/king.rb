require_relative "../modules/stepping_piece"
require_relative "../piece"

class King < Piece
  include SteppingPiece

  DELTAS = [[-1, -1], [-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1]]

  def initialize(pos, board, color)
    @name = (color == :white) ? "\u2654" : "\u265A"
    @name = @name.encode("utf-8")
    super
  end

  def moves
    moves_arr = SteppingPiece::moves(DELTAS, @pos, @board, self)
  end


end
