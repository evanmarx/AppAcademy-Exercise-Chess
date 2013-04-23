class Board

  attr_accessor :size, :grid, :wh_pieces, :bl_pieces

  def initialize(size = 8)
    @size = size
    @grid = Array.new(size) {Array.new(size)}
    @wh_pieces, @bl_pieces = [], []
  end

  def board_setup

  end

  def display
    p @grid
  end

  def board_move
    # move piece on board
    # call move method on piece
  end

end