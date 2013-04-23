# encoding: utf-8

class Queen < Piece


  def display
    @color == :wh ? "♕" : "♛"
  end

end
