module SlidingPiece
  def self.moves(dirs, pos, board, piece)
    moves_arr = []
    r, c = pos

    dirs.each do |dir|
      x, y = dir
      new_pos = [r + x, c + y]

      until !board.in_bounds?(new_pos) || !board[new_pos].instance_of?(NullPiece)
        moves_arr << new_pos
        new_pos = [new_pos[0] + x, new_pos[1] + y]
      end

      if board.in_bounds?(new_pos) && piece.opponent?(board[new_pos])
        moves_arr << new_pos
      end
    end

    moves_arr
  end
end
