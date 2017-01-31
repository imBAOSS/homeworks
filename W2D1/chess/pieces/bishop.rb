require_relative "../modules/sliding_piece"
require_relative "../piece"

class Bishop < Piece
  include SlidingPiece

  def initialize(pos, board, color)
    @name = "B"
    super
  end
end
