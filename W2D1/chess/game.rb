require_relative 'display'
require_relative 'board'
require_relative 'player'
require_relative 'human_player'

class ChessGame
  attr_accessor :board, :display, :player1, :player2
  attr_reader :current_player

  def initialize
    @board = Board.new
    @display = Display.new(@board, self)
    @player1 = HumanPlayer.new("Alice", :white, self)
    @player2 = HumanPlayer.new("Bob", :black, self)
    @current_player = @player1
  end

  def play
    loop do
      @display.render
      @current_player.play_turn
      break if game_over?
      switch_players
    end
    puts "#{@winner} wins!"
  end

  def game_over?
    if @board.checkmate?(:white)
      @winner = @player2.name
      return true
    elsif @board.checkmate?(:black)
      @winner = @player1.name
      return true
    end

    false
  end

  def switch_players
    @current_player = (@current_player == @player1) ? @player2 : @player1
    @display.cursor.cursor_pos = (@current_player == @player1) ? [7, 3] : [0, 3]
  end
end
