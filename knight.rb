require 'piece'

class Knight < Piece

  DELTAS = [[1, 2],
            [2, 1],
            [-1, 2],
            [-1, -2],
            [1, -2],
            [-2, 1],
            [-2, -1],
            [2, -1]]

  def initialize(pos, color)
    super
  end

  def poss_moves(board)
    valid_m = []

    DELTAS.each do |dx,dy|
      if (0..8).include?( pos[0]+dx) && (0..8).include?( pos[1]+dy)
        valid_m << [pos[0] + dx, pos[1] + dy]
      end
    end


  end



end