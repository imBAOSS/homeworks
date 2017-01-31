require "colorize"
require_relative "cursor"
require_relative "board"

class Display
  attr_accessor :cursor
  def initialize(board)
    @cursor = Cursor.new([0, 0], board)
    @board = board
  end

  def render
    system("clear")
    string = "    0 1 2 3 4 5 6 7\n".colorize(:magenta)
    string += "    a b c d e f g h\n".colorize(:magenta)
    for i in 0...8 do
      row = "#{(i.to_s + " " + (8 - i).to_s).colorize(:magenta)} "
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
