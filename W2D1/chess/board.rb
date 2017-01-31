require_relative "piece"
require_relative "pieces/piece_require"

class Board
  ROOK_POSITIONS = [[0, 0], [0, 7], [7, 0], [7, 7]]
  KNIGHT_POSITIONS = [[0, 1], [0, 6], [7, 1], [7, 6]]
  BISHOP_POSITIONS = [[0, 2], [0, 5], [7, 2], [7, 5]]
  QUEEN_POSITIONS = [[0, 3], [7, 3]]
  KING_POSITIONS = [[0, 4], [7, 4]]

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance } }
    populate_grid
  end

  def populate_grid
    populate_piece(ROOK_POSITIONS, Rook)
    populate_piece(KNIGHT_POSITIONS, Knight)
    populate_piece(BISHOP_POSITIONS, Bishop)
    populate_piece(QUEEN_POSITIONS, Queen)
    populate_piece(KING_POSITIONS, King)

    @grid[1].each.with_index do |space, col|
      @grid[1][col] = Pawn.new([1, col], self, :black)
    end

    @grid[6].each.with_index do |space, col|
      @grid[6][col] = Pawn.new([6, col], self, :white)
    end

    # for i in 2..5 do
    #   for j in 0...8 do
    #     @grid[i][j] = NullPiece.instance
    #   end
    # end

    p @grid[0][1].moves
  end

  def populate_piece(positions, piece_type)
    positions.each do |pos|
      color = (pos[0] == 0) ? :black : :white
      self[pos] = piece_type.new(pos, self, color)
    end
  end

  def move_piece(start_pos, end_pos)
    begin
      if self[start_pos].nil?
        raise InvalidMoveError.new("No piece at #{start_pos}")
      end

      unless self[start_pos].moves.include?(end_pos)
        raise InvalidMoveError.new("Cannot move to #{end_pos}")
      end
      old_piece = self[end_pos]
      self[end_pos] = self[start_pos]
      self[start_pos] = nil

    rescue InvalidMoveError => e
      puts e.msg
    end

  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value unless @grid[pos[0]][pos[1]].nil?
  end

  def in_bounds?(pos)
    x,y = pos
    x.between?(0,7) && y.between?(0,7)
  end

  def in_check?(color)
    opposite_color = (color == :white) ? :black : :white
    opposite_pieces = []
    king = nil

    @grid.flatten.each do |piece|
      opposite_pieces << piece if piece.color == opposite_color
      king = piece if piece.color == color && piece.instance_of?(King)
    end

    opposite_pieces.any? do |piece|
      piece.moves.include?(king.pos)
    end
  end

  def checkmate?(color)
  end
end

class InvalidMoveError < StandardError
  attr_reader :msg
  def initialize(msg)
    @msg = msg
  end
end
