require 'byebug'

class Board
  attr_accessor :cups, :name1, :name2, :stones

  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    @name1 = name1
    @name2 = name2
    @stones = []
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_index do |i|
      unless i == 6 || i == 13
        @cups[i] << :stone until @cups[i].length == 4
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos <= 0 || start_pos == 6 || start_pos >= 13
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    current_pos = start_pos
    @stones = @cups[start_pos]
    @cups[start_pos] = []

    until @stones.empty?
      current_pos += 1
      current_pos = 0 if current_pos > 13

      if current_player_name == @name1
        distribute_stones(current_pos) unless current_pos == 13
      else
        distribute_stones(current_pos) unless current_pos == 6
      end
    end

    render
    next_turn(current_pos, current_player_name)
    # next_turn
  end

  def distribute_stones(pos)
    @cups[pos] << @stones.shift
  end

  def next_turn(ending_cup_index, current_player)
    # helper method to determine what #make_move returns
    if ending_cup_index == 6 && current_player == @name1
      :prompt
    elsif ending_cup_index == 13 && current_player == @name2
      :prompt
    elsif @cups[ending_cup_index].length == 1
      :switch
    else
      ending_cup_index
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    player_one_side = @cups[0..5].all? { |cup| cup.empty? }
    player_two_side = @cups[7..12].all? { |cup| cup.empty? }
    player_one_side || player_two_side
  end

  def winner
    player_one_points = @cups[6].length
    player_two_points = @cups[13].length

    if player_one_points == player_two_points
      :draw
    elsif player_one_points > player_two_points
      @name1
    else
      @name2
    end
  end
end
