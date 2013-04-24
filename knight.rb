# encoding: utf-8

require_relative "piece"

class Knight < Piece

  DELTAS = [[1, 2],
            [2, 1],
            [-1, 2],
            [-1, -2],
            [1, -2],
            [-2, 1],
            [-2, -1],
            [2, -1]]

  def moves
    moves = []

    DELTAS.each do |dx, dy|
      move = [@pos[0] + dx, @pos[1] + dy]
      moves << move if @board.in_board?(move) && valid_move?(move)
    end

    moves
  end


  def display
    @color == :wh ? "♘" : "♞"
  end

end