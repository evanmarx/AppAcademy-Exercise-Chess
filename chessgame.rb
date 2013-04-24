# encoding: utf-8

require_relative "board"
require_relative "player"

class Chessgame

  attr_accessor :board, :quit

  def initialize
    @quit = false
    @board = Board.new()
    @player1 = HumanPlayer.new
    @player2 = HumanPlayer.new
  end


  def run
    startup

    turn until winner? || @quit

    game_over
  end

  def winner?
    @board.check_mate?(:wh) || @board.check_mate?(:bl)
  end

  def startup
    puts "Welcome to Chess"
    @board.board_setup
    @board.display
  end

  def turn
    raw = @player1.get_move
    if raw == :quit
      @quit = true
    else
      start_pos, end_pos = raw
    end
    @board.legal_move(start_pos, end_pos)
    @board.display

    raw = @player2.get_move
    if raw == :quit
      return game_over
    else
        start_pos, end_pos = raw
    end
    @board.legal_move(start_pos, end_pos)
    @board.display
  end


  def game_over
    puts "You quitter." unless winner?
    puts @board.check_mate?(:wh) ? "Black wins!" : "White wins!"
  end
end

a = Chessgame.new
a.run