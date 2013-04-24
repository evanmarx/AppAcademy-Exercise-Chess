# encoding: utf-8

class Rook < Piece

  DIRECTIONS = [[1,0], [0,1], [-1,0], [0,-1]]

  def poss_moves
    valid_moves = []
    x,y = pos
    start_pos = self.pos
    DIRECTIONS.each do |direction|
      valid_moves += move_explorer(start_pos, direction)
    end
    valid_moves
  end



  def move_explorer(start_pos, direction)
    found_moves = []
    x,y = start_pos
    dx,dy = direction
    new_spot = [ x+dx , y+dy ]
    exists = @board.get_spot(new_spot)

    if exists && @board.get_spot(new_spot).color != self.color
      found_moves << new_spot
    elsif !exists && @board.in_board?(new_spot)
      found_moves << new_spot
      found_moves += move_explorer(new_spot,direction)
    end

    found_moves
  end

  def display
    @color == :wh ? "♖" : "♜"
  end


end
