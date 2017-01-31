require "colorize"
require_relative "cursor"
require_relative "board"

class Display
  def initialize(board)
    @cursor = Cursor.new([0, 0], board)
    @board = board
    render
    @cursor.get_input
    render
    @cursor.get_input
    render
    @cursor.get_input
    render
  end

  def render
    string = "\n"
    for i in 0...8 do
      row = ""
      for j in 0...8 do
        char = @board[[i, j]].to_s

        char = colorize_char(char, [i, j])
        char << " "
        row << char
      end

      row << "\n"
      string << row
    end
    puts string
  end

  def colorize_char(char, pos)
    if pos == @cursor.cursor_pos
      if @cursor.selected
        char = char.colorize(:background => :light_cyan)
      else
        char = char.colorize(:background => :light_white)
      end
    end
    char
  end
end
