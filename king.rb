# encoding: utf-8

class King < Piece


  def display
    @color == :wh ? "♔" : "♚"
  end

end
