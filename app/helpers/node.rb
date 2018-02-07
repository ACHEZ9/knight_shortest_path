class Node
  @@moves = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]

  attr_reader :position, :prev

  def initialize(position, prev)
    @prev = prev
    @position = position
  end

  def get_valid_moves
    valid_moves = []
    @@moves.each do |move|
      new_pos = [@position[0] + move[0], @position[1] + move[1]]
      valid_moves << new_pos if is_position_valid?(new_pos)
    end

    valid_moves
  end

  private

  def is_position_valid?(position)
    position[0].between?(0, 8) && position[1].between?(0, 8)
  end

end
