require_relative "piece"

class Board

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    populate_grid
  end

  def populate_grid
    for i in 0...8 do
      for j in 0...8 do
        @grid[i][j] = ((i + 2) % 8 < 4) ? Piece.new : nil
      end
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
    @grid[pos[0]][pos[1]] = value
  end

  def in_bounds?(pos)
    x,y = pos
    x.between?(0,7) && y.between?(0,7)
  end
end

class InvalidMoveError < StandardError
  attr_reader :msg
  def initialize(msg)
    @msg = msg
  end
end

b = Board.new
