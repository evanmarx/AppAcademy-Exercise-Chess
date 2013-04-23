# encoding: utf-8

class Bishop < Piece

  def display
    @color == :wh ? "♗" : "♝"
  end


end
