require "piece"
require "knight"

class Board

  attr_accessor :size, :grid

  def initialize(size = 8)
    @size = size
    @grid = Array.new(size) {Array.new(size)}
  end

  def board_setup
    set_pawns
    #set_backrows
  end

  def set_pawns
    self.size.times do |i|
      @grid[1][i] = Knight.new([1,i], :wh)
      @grid[-2][i] = Knight.new([-2,i], :bl)
    end

  end

  def display
    p @grid
  end

  def board_move(piece)

    # NOT BLOODY READY
    # begin
    #   piece.move(dest, self)
    # rescue IllegalMove
    #   puts "Illegal Move"
    # end
  end

  def board_remove
  end

  def setup_pieces
  end

  def spot(pos)
    x, y = pos
    self.grid[x][y]
  end

end