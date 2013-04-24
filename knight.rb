# encoding: utf-8

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

  def moves
    valid_moves = check_onboard

    valid_moves.delete_if do |pos|
      if @board.get_spot(pos)
        @board.get_spot(pos).color == @color
      end
    end

  valid_moves
  end



  def check_onboard
    valid_moves=[]

    DELTAS.each do |dx,dy|
      pos_check = [@pos[0] + dx, @pos[1] + dy]
      valid_moves << pos_check if @board.in_board?(pos_check)
    end

    valid_moves
  end


  def display
    @color == :wh ? "♘" : "♞"
  end

end