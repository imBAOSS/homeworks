require_relative "../piece"

class Pawn < Piece
  def initialize(pos, board, color)
    @name = "P"
    super
  end
end
