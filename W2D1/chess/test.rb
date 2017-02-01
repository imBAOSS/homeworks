require_relative 'game'

g = ChessGame.new
g.play

# require_relative 'display'
#
# b = Board.new
# d = Display.new(b)
#
# d.render
# p "---------------"
# b.move_piece([6,5], [5,5])
# b.move_piece([1,4], [3,4])
# b.move_piece([6,6], [4,6])
# b.move_piece([0,3], [4,7])
# d.render
# p "---------------"
# p b.checkmate?(:white)
# p b.checkmate?(:black)
# p "---------------"
# b.move_piece([6,0], [5,0])
# b.move_piece([1,0], [2,0])
#
# while true
#   d.render
#   d.cursor.get_input
# end
#
#
#
#
# # @grid.flatten.all? do |piece|
# #   next if piece.color != color
# #   valid_moves = piece.valid_moves
# # 	valid_moves.empty?
# # end
