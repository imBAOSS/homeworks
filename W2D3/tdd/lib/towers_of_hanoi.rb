class TowersOfHanoi
  attr_reader :towers, :num_disks

  def initialize(num_disks = 3)
    @num_disks = num_disks
    @towers = populate_towers
  end

  def play

  end

  def move(from_tower, to_tower)
    raise "Can't move from an empty tower" if @towers[from_tower].empty?

    unless [from_tower, to_tower].all? { |n| (0..2).include?(n) }
      raise "Tower does not exist!"
    end

    raise "Can't move onto the same tower!" if from_tower == to_tower

    unless valid_move?(from_tower, to_tower)
      raise "Can't stack a larger disk onto a smaller disk"
    end

    @towers[to_tower].push(@towers[from_tower].pop)
  end

  def won?
    return true if @towers[0].length == @num_disks
    @towers[2].length == @num_disks
  end

  private

  def populate_towers
    towers = Array.new(3) { [] }

    @num_disks.downto(1) { |i| towers[1] << i }

    towers
  end

  def valid_move?(from_tower, to_tower)
    return true if @towers[to_tower].last.nil?
    @towers[to_tower].last > @towers[from_tower].last
  end

end
