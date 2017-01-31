require_relative "../piece"

class Pawn < Piece
  WHITE_MOVES = [
    [-1, 0],
    [-2, 0],
    [-1, -1],
    [-1, 1]
  ]
  BLACK_MOVES = [
    [1, 0],
    [2, 0],
    [1, -1],
    [1, 1]
  ]
  def initialize(pos, board, color)
    @name = "P"
    @home_row = (color == :white) ? 6 : 1
    @all_possible_moves = (color == :white) ? WHITE_MOVES : BLACK_MOVES
    super
  end

  def moves
    # hard-code in the four specific moves that each pawn can take
    possible_moves = diagonal_moves + forward_moves
  end

  def diagonal_moves
    r, c = @pos
    moves_arr = @all_possible_moves.dup

    possible_moves = []
    moves_arr.drop(2).each do |diag|
      dx, dy = diag
      new_pos = [r + dx, c + dy]
      possible_moves << new_pos if self.opponent?(@board[new_pos])
    end

    possible_moves
  end

  def forward_moves
    r, c = @pos
    possible_moves = []

    dx, dy = @all_possible_moves[0]
    one_forward_pos = [r + dx, c + dy]

    if @board[one_forward_pos].color == :null
      possible_moves << one_forward_pos

      if r == @home_row
        dx, dy = @all_possible_moves[1]
        two_forward_pos = [r + dx, c + dy]

        possible_moves << two_forward_pos if @board[two_forward_pos].color == :null
      end
    end
    possible_moves
  end
end
