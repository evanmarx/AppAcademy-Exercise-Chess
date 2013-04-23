require_relative "piece"

class Knight < Piece

  @@deltas = [[1, 2],
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
    valid_m = check_onboard(board)

    valid_m.delete_if do |pos|
      if board.get_spot(pos)
        board.get_spot(pos).color == self.color
      end
    end
    # add check_check

  end

  def check_onboard(board)
    valid_m=[]

    @@deltas.each do |dx,dy|
      if (0..board.size).include?( self.pos[0]+dx) && (0..board.size).include?( self.pos[1]+dy)
        valid_m << [self.pos[0] + dx, self.pos[1] + dy]
      end
    end

    valid_m
  end


end