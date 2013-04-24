class SlidePiece < Piece

  def explore_moves(start_pos, direction)
    moves = []
    x,y = start_pos
    dx,dy = direction
    next_position = [ x+dx , y+dy ]
    exists = @board.get_spot(next_position)

    if exists && @board.get_spot(next_position).color != self.color
      moves << next_position
    elsif @board.in_board?(next_position) && !exists
      moves << next_position
      moves += self.explore_moves(next_position,direction)
    end

    moves
  end


end