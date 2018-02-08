class Node
  @@moves = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]

  attr_reader :chess_notation, :prev

  def initialize(chess_notation, prev)
    @prev = prev
    @chess_notation = chess_notation
    @position = convertFromChessNotation(chess_notation)
  end

  def get_valid_moves
    valid_moves = []
    @@moves.each do |move|
      new_pos = [@position[0] + move[0], @position[1] + move[1]]
      valid_moves << convertToChessNotation(new_pos) if is_position_valid?(new_pos)
    end

    valid_moves
  end

  private

  def is_position_valid?(position)
    position[0].between?(0, 8) && position[1].between?(0, 8)
  end

  def convertFromChessNotation(chess_notation)
    [chess_notation[0].ord - 96, chess_notation[1].to_i]
  end

  def convertToChessNotation(position)
    first = (position[0] + 96).chr
    second = position[1].to_s
    first + second
  end

end
