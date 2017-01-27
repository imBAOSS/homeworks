class Game
  attr_reader :fragment, :dictionary, :player1, :player2
  attr_accessor :current_player

  def initialize(fragment, dictionary, player1, player2)
    @fragment = fragment
    @dictionary = dictionary
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  

end
