require_relative "piece"

class Knight < Piece

  DELTAS = [[1, 2],
            [2, 1],
            [-1, 2],
            [-1, -2],
            [1, -2],
            [-2, 1],
            [-2, -1],
            [2, -1]]

  # def initialize(pos, color)
#     super
#   end

  def poss_moves
    valid_m = check_onboard

    valid_m.delete_if do |pos|
      if @board.get_spot(pos)
        @board.get_spot(pos).color == @color
      end
    end
    # add check_check

  end

  def check_onboard
    valid_m=[]

    DELTAS.each do |dx,dy|
      if (0..@board.size).include?( @pos[0]+dx) && (0..@board.size).include?( self.pos[1]+dy)
        valid_m << [@pos[0] + dx, @pos[1] + dy]
      end
    end

    valid_m
  end


end