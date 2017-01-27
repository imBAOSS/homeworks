require_relative 'card.rb'
require_relative 'humanplayer.rb'

class Board
  attr_reader :width, :height
  attr_accessor :guessed_pos, :board

  def initialize(height = 4, width = 4)
    @height = height
    @width = width
    @board = []
  end

  def populate
    (1..((@height * @width) / 2)).each do |id|
      2.times { @board << Card.new(id) }
    end

    @board = @board.shuffle.each_slice(@width).to_a
  end

  def render
    viewable_board = @board.flatten.map do |card|
      card.hidden ? "X" : card.to_s
    end

    viewable_board.each_slice(@width).to_a
  end

  def display_board
    render.each { |pos| p pos }
  end

  def won(player_one, player_two)
    if player_one.matches > player_two.matches
      print "#{player_one.name} wins!"
    elsif player_one.matches < player_two.matches
      print "#{player_two.name} wins!"
    else
      print "It's a draw!"
    end
  end

  def reveal(pos)
    self[pos].reveal
  end

  def hide(pos)
    self[pos].hide
  end

  def game_over?
    @board.flatten.none? { |card| card.hidden }
  end

  def [](pos)
    x, y = pos
    @board[x][y]
  end

end
