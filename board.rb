require_relative "piece"
require_relative "knight"
require_relative "rook"
require_relative "queen"
require_relative "bishop"
require_relative "king"
require_relative "pawn"


class Board

  attr_accessor :size, :grid

  @@b_row = [Rook, Knight,
             Bishop, Queen,
             King, Bishop,
             Knight, Rook]

  def initialize(size = 8)
    @size = size
    @grid = Array.new(size) {Array.new(size)}
  end

  def board_setup
    set_pawns
    set_backrows
  end

  def set_pawns
    self.size.times do |i|
      @grid[1][i] = Pawn.new([1,i], :wh)
      @grid[-2][i] = Pawn.new([-2,i], :bl)
    end
  end

  def set_backrows
    self.size.times do |i|
      @grid[0][i] = @@b_row[i].new([0,i], :wh)
      @grid[-1][i] = @@b_row.[i].new([-1,i], :bl)
    end
  end

  def display
    p @grid
  end

  def b_move(source, dest)
    piece = get_spot(source)
    begin
      piece.move(dest, self)
    rescue IllegalMove
      puts "Illegal Move"
    end
    self.set_spot(piece, dest)
  end

  def b_remove(pos)
     self.set_spot(nil, pos)
  end

  def set_spot(to_put, pos)
    x,y = pos
    self.grid[x][y] = to_put
  end

  def get_spot(pos)
    x, y = pos
    self.grid[x][y]
  end

end