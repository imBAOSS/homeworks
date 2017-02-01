require_relative 'player'

class HumanPlayer < Player
  attr_reader :name, :color

  def initialize(name = "Bob", color, game)
    super
    @cursor = @display.cursor
  end

  def play_turn
    # find start position
    start_pos = []
    end_pos = []
    while start_pos == end_pos
      start_pos, end_pos = get_move
    end

    @board.move_piece(start_pos, end_pos)
    @cursor.toggle_selected
    @display.render
  end

  def get_move
    start_pos = get_pos(true)
    @cursor.toggle_selected
    @valid_moves = @board[start_pos].valid_moves

    @display.selected_pos = start_pos
    @display.valid_moves = @valid_moves
    # highlight available moves
    # highlight starting position

    end_pos = get_pos(false, start_pos)
    @cursor.toggle_selected if start_pos == end_pos
    # p @start_pos
    # p end_pos
    # sleep(2)
    [start_pos, end_pos]
  end

  def get_pos(is_start, start_pos = nil)
    input = nil
    pos = []
    loop do
      @display.render
      input = @cursor.get_input
      pos = @cursor.cursor_pos
      break if valid_selection?(input, is_start, start_pos)
    end
    pos = @cursor.cursor_pos

  end

  def valid_selection?(input, is_start, start_pos = nil)
    return false if input.nil?

    pos = @cursor.cursor_pos
    return true if pos == start_pos && !is_start

    is_start ? (@board[pos].color == @color) : @valid_moves.include?(pos)
  end

end
