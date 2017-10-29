class Board
  attr_reader :grid

  def initialize(grid = Array.new(3) {Array.new(3)})
    @grid = grid
  end

  def place_mark(pos, mark)
    grid[pos[0]][pos[1]] = mark
  end

  def empty?(pos)
    if grid[pos[0]][pos[1]] == nil
      return true
    else
      false
    end
  end

  def winner
    grid.each do |row|
      if row.each.all? {|el| el == :X}
        return :X
      end
    end

    if grid[0][2] == :X && grid[1][1] == :X && grid[2][0] == :X
      return :X
    end

    if grid[0][0] == :X && grid[1][1] == :X && grid[2][2] == :X
      return :X
    end

    if grid[0][0] == :O && grid[1][0] == :O && grid[2][0] == :O
      return :O
    end

    if grid[0][1] == :O && grid[1][1] == :O && grid[2][1] == :O
      return :O
    end

    if grid[0][2] == :O && grid[1][2] == :O && grid[2][2] == :O
      return :O
    end

  end

  def over?
    grid.flatten.none? { |pos| pos.nil?} || winner
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  # def over?
  #   if grid.flatten.nil?
  #     return false
  #   end
  #
  #   if grid.flatten.length < 9
  #     return false
  #   end
  #
  #   if self.winner != nil
  #     return true
  #   end
  #
  #   if grid.flatten.length == 9 && self.winner == nil
  #     return true
  #   end
  #
  # end

end
