# encoding: utf-8

class Pawn < Piece

  DELTAS = [[0, 1], [0, 2], [1, 1], [-1, 1]]

  def poss_moves
    valid_m = []
    
    # Add +2 Start move if on home row.
    # if self.pos[0] == 1 || self.pos[0] == 6
#       valid_m << [pos[0], pos[1]+2] if    
#       
    
    # DELTAS.each do |dx,dy|
#       pos_check = [@pos[0] + dx, @pos[1] + dy]
#       valid_m << pos_check if in_board?(pos_check)
#     end
    
    valid_m.delete_if do |pos|
      if @board.get_spot(pos)
        @board.get_spot(pos).color == @color
      end
    
  end


end
