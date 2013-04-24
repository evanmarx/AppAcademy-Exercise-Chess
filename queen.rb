# encoding: utf-8

require_relative "slider"

class Queen < SlidePiece

DIRECTIONS = [[1, 0], [0, 1], [-1, 0], [0, -1],
             [1, 1], [-1, -1], [1, -1], [-1, 1]]

  def moves
    moves = []
    start_pos = self.pos
    DIRECTIONS.each { |direction| moves += explore_moves(start_pos, direction) }

    moves
  end

  def display
    @color == :white ? "♕" : "♛"
  end

end
