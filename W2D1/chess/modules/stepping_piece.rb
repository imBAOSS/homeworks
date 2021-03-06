module SteppingPiece
  def self.moves(dirs, pos, board, piece)
    r,c = pos
    moves_arr = []
    dirs.each do |delta|
      new_r = r + delta[0]
      new_c = c + delta[1]

      new_pos = [new_r, new_c]

      valid_pos = board.in_bounds?(new_pos) && board[new_pos].color != piece.color
      moves_arr << new_pos if valid_pos
    end

    moves_arr
  end
end
