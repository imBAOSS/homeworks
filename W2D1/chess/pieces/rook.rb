require_relative "../modules/sliding_piece"
require_relative "../piece"

class Rook < Piece
  include SlidingPiece

  DIRS = [
    [1, 0],
    [0, 1],
    [-1, 0],
    [0, -1]
  ]

  def initialize(pos, board, color)
    @name = "R"
    super
  end
end
