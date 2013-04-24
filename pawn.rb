# encoding: utf-8

class Pawn < Piece

  DELTAS = [[1, 0], [2, 0], [1, 1], [1, -1]]

  def moves
    moves = []

    # scalar multiplication flips deltas:
    # white => positive, black => negative
    @color == :wh ? deltas = DELTAS : deltas = DELTAS.map {|x,y| [x*-1, y*-1]}
    p deltas
    poss_moves = deltas.map {|dx,dy| [@pos[0]+dx, @pos[1]+dy]}

    moves << poss_moves[0] unless @board.get_spot(poss_moves[0])

    moves << poss_moves[1] if move_two?(moves, poss_moves)

    2.times { |i| moves << poss_moves[i+2] if capture?(poss_moves[i+2]) }

    moves
  end

  def move_two?(moves, poss_move)
     (@pos[0] == 1 || @pos[0] == 6) && moves.size == 1 && @board.get_spot(poss_move).nil?
  end

  def capture?(poss_move)
    @board.get_spot(poss_move) && @board.get_spot(poss_move).color != @color
  end

  def display
    @color == :wh ? "♙" : "♟"
  end

end
