require "colorize"
require_relative "cursor"
require_relative "board"

class Display
  attr_accessor :cursor, :selected_pos, :valid_moves

  def initialize(board, game)
    @cursor = Cursor.new([7, 3], board)
    @board = board
    @game = game
  end

  def render
    system("clear")
    # string = "    0 1 2 3 4 5 6 7\n".colorize(:magenta)
    # string = "  a b c d e f g h\n".colorize(:magenta)
    @is_check = @board.in_check?(@game.current_player.color)
    string = ""
    for i in 0...8 do
      # row = "#{(i.to_s + " " + (8 - i).to_s).colorize(:magenta)} "
      # row = "#{((8 - i).to_s).colorize(:magenta)} "
      row = ""
      for j in 0...8 do
        char = " "
        char << @board[[i, j]].to_s
        char << " "
        char = char.colorize(:background => :light_white) if (i + j) % 2 == 1

        char = colorize_char(char, [i, j])


        row << char
      end

      row << "\n"
      string << row
    end
    string << "#{@game.current_player.name}'s turn.\n"
    string << "CHECK!".colorize(:red) if @is_check
    puts string

  end

  def colorize_char(char, pos)
    if pos == @cursor.cursor_pos
      # char = char.colorize(:background => :light_yellow)
      char = char.uncolorize
      char = "\033[48;5;209m#{char}\033[0m"
    elsif @is_check && @board[pos].is_a?(King) && @board[pos].color == @game.current_player.color
      char = char.uncolorize
      char = "\033[48;5;196m#{char}\033[0m"
      # char = char.colorize(:background => :light_red)
    elsif @cursor.selected
      if pos == @selected_pos
        # char = char.colorize(:background => :light_blue)
        char = char.uncolorize
        char = "\033[48;5;33m#{char}\033[0m"
      elsif @valid_moves.include?(pos)
        char = char.uncolorize
        char = "\033[48;5;77m#{char}\033[0m"
        # char = char.colorize(:background => :light_green)
      end
    end

    # if cursor is selected
      # if pos == cursor_pos.
        # background for char is blue.
      # if pos is in valid_moves
        # background for char is green.

    # this requires for selected_pos and valid_moves to be set once
    #   a starting position is selected.

    # also, selected_pos and valid_moves need to be reset once an end is selected or it's reset.


    # if pos == @cursor.cursor_pos
    #   if @cursor.selected
    #     char = char.colorize(:background => :light_cyan)
    #   else
    #     char = char.colorize(:background => :light_white)
    #   end
    # end

    char
  end
end
