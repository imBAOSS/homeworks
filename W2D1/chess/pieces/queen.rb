require_relative "../modules/sliding_piece"
require_relative "../piece"

class Queen < Piece
  include SlidingPiece

  def initialize(pos, board, color)
    @name = "Q"
    super
  end
end
