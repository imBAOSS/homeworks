require 'colorize'

class Piece
  attr_reader :board, :color
  attr_accessor :pos

  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end

  def moves
  end
  # 
  # def valid_pos?(pos)
  #
  # end

  def valid_moves
    board_copy = Board.deep_dup(@board)
    moves_arr = self.moves
    new_moves_arr = []
    moves_arr.each do |move|
      old_position = @pos.dup
      board_copy.move_piece!(old_position, move)
      new_moves_arr << move unless board_copy.in_check?(@color)
      board_copy.move_piece!(move, old_position)
    end
    new_moves_arr
  end

  def move_into_check?(end_pos)
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
    return false if other_piece.nil?
    return false if self.color == :null || other_piece.color == :null
    self.color != other_piece.color
  end
end
