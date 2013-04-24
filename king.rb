# encoding: utf-8

class King < Piece

  DELTAS = [[1, 0], [0, 1], [-1, 0], [0, -1],
               [1, 1], [-1, -1], [1, -1], [-1, 1]]


  def display
    @color == :wh ? "♔" : "♚"
  end

end
