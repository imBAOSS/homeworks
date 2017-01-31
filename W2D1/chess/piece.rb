require 'colorize'

class Piece
  attr_reader :pos, :board, :color

  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end

  def moves
  end

  def valid_pos?(pos)
    @board[pos].color != @color
  end

  def valid_moves
  end

  def to_s
    if @color == :white
      return @name.colorize(:red)
    elsif @color == :black
      return @name.colorize(:green)
    else
      return @name.colorize(:light_black)
    end
  end

  def opponent?(other_piece)
    return false if self.color == :null || other_piece.color == :null
    self.color != other_piece.color
  end
end
