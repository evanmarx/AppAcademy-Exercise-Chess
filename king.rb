# encoding: utf-8

class King < Piece

  DELTAS = [[1, 0], [0, 1], [-1, 0], [0, -1],
          [1, 1], [-1, -1], [1, -1], [-1, 1]]


  def moves
    moves = []

    DELTAS.each do |dx, dy|
      move = [@pos[0] + dx, @pos[1] + dy]
      moves << move if @board.in_board?(move) && valid_move?(move)
    end

    moves
  end



  def display
    @color == :white ? "♔" : "♚"
  end

end
