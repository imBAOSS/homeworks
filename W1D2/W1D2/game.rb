require_relative 'board.rb'
require "byebug"

class Game
  attr_reader :board

  def initialize(player_one, player_two)
    @board = Board.new
    @board.populate
    @previous_guess = nil
    @player_one = player_one
    @player_two = player_two
    @current_player = @player_one
  end

  def play
    # debugger
    until @board.game_over?
      @board.display_board
      puts "#{@player_one.name}: #{@player_one.matches}"
      puts "#{@player_two.name}: #{@player_two.matches}"
      puts "#{@current_player.name}, input your first guess: "
      @first_guess = handle_guess(@current_player.get_guess)
      @board.display_board

      puts "#{@current_player.name}, input your second guess: "
      @second_guess = handle_guess(@current_player.get_guess)
      @board.display_board
      print "\n"

      if match?
        print "You got a match!\n"
        @current_player.matches += 1
      else
        reset_guess
        switch_player
      end

      sleep(3)
      system("clear")
      # switch_player
    end
    @board.won(@player_one, @player_two)
  end

  def handle_guess(guess)
    # if valid?(guess)
    #   reveal(guess)
    #   guess
    # else
    #   guess = invalid_guess(guess)
    # end
    guess = invalid_guess(guess) unless valid?(guess)
    reveal(guess)
    guess
  end

  def switch_player
    @current_player = @current_player == @player_one ? @player_two : @player_one
  end

  def valid?(guess)
    x, y = guess
    return false if x.nil? || y.nil?
    return false unless x < @board.height && y < @board.width
    return false unless guess.length == 2 && @board[guess].hidden
    true
  end

  def reveal(guess)
    @board.reveal(guess)
  end

  def invalid_guess(guess)
    until valid?(guess)
      print "Invalid guess. Input new guess."
      guess = @current_player.get_guess
    end

    guess
  end

  def match?
    # debugger
    @board[@first_guess].id == @board[@second_guess].id
  end

  def reset_guess
    @board.hide(@first_guess)
    @board.hide(@second_guess)
    puts "You didn't get a match."
  end

end

if __FILE__ == $PROGRAM_NAME
  Game.new(HumanPlayer.new("Alicia"), HumanPlayer.new("Bao")).play

end
