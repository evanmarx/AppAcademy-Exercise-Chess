# encoding: utf-8

class Piece



  attr_accessor :pos, :color, :board


  def initialize(pos, color, board)
    @pos = pos
    @color = color
    @board = board
  end

  def moves
  end

  # Check if the spot is empty or a bad guy.
  def valid_move?(move)
    @board.get_spot(move).nil? || @board.get_spot(move).color != @color
  end


end
