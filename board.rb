# encoding: utf-8


require_relative "piece"
require_relative "knight"
require_relative "rook"
require_relative "queen"
require_relative "bishop"
require_relative "king"
require_relative "pawn"
require_relative "slider"


class Board

  attr_accessor :size, :grid

  BACK_ROW = [Rook, Knight,
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
      Pawn.new([1,i], :wh, self)
      Pawn.new([self.size-2,i], :bl, self)
    end
  end

  def set_backrows
    self.size.times do |i|
      BACK_ROW[i].new([0,i], :wh, self)
      BACK_ROW[i].new([self.size-1,i], :bl, self)
    end
  end

  def display
    puts "xy|" + (0...@grid.size).map {|i| i.to_s}.join(" ")
    @grid.size.times {|i| puts i.to_s.ljust(3) + print_row(i)}
  end

  def print_row(i)
    @grid[i].map {|el| el ? el.display.ljust(2) : "  "}.join("")
  end

  def move(from_pos, to_pos) # RENAME

    piece = get_spot(from_pos)
    p piece.class
    p piece.moves
    raise IllegalMove.new("No Piece Found") unless piece
    raise IllegalMove unless piece.moves.include?(to_pos)

    self.set_spot(piece, to_pos)
    self.nil_spot(from_pos)
    piece.pos = to_pos

    self
  end

  def legal_move(source, dest)
    begin
      move(source, dest)
    rescue IllegalMove => e
      puts e.message
    end
  end


  def nil_spot(pos)
     self.set_spot(nil, pos)
     self
  end

  def set_spot(to_put, pos)
    x,y = pos
    self.grid[x][y] = to_put
    self
  end

  def get_spot(pos)
    if in_board?(pos)
      x, y = pos
      self.grid[x][y]
    else
      nil
    end
  end

  def in_board?(pos)
    pos.all? {|el| (0...@grid.size).include?(el)}
  end

  # checks if a spot is in check, returns the pieces that check it
  def in_check?(color)
    king_spot = get_king_spot(color)
    whole_grid = @grid.flatten.compact
    whole_grid.any? {|piece| piece.moves.include?(king_spot)}
  end

  def check_mate?(color)
    # pieces = []
    # @grid.flatten.compact.each do |piece|
    #   pieces << piece.dup if piece.color == color
    # end
    boards = []
    pieces = self.pieces.select {|piece| piece.color == color}
    pieces.each do |piece|
      piece.moves.each do |move|
        boards << self.dup.move(piece.pos, move)
      end
    end

    boards.each { |board| p board.in_check?(color) }

  end

  def reveal_check?
  end

  def get_king_spot(color)
     @grid.flatten.find {|piece| self.right_king?(piece, color)}.pos
  end

  def right_king?(piece, color)
    piece.class == King && piece.color == color
  end

  def dup
    new_board = Board.new
    self.pieces.each { |piece| piece.dup(new_board) }
    new_board
  end

  def pieces
    @grid.flatten.compact
  end

end


class IllegalMove < StandardError
end