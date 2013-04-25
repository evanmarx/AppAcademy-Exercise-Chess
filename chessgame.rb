

# encoding: utf-8

require_relative "board"
require_relative "player"

class Chessgame

  attr_accessor :board

  def initialize
    @board = Board.new()
    @player1 = HumanPlayer.new
    @player2 = HumanPlayer.new
  end


  def run
    startup

    until winner? || @player1.quitter || @player2.quitter
      # REV: A lot of logic for displaying and updating
      # the board betwee player turns is being run from
      # the player class. This is requiring you to pass the
      # board object to this class, whereas you could have
      # mediated the interaction between board/player through
      # this game class and thus make it more transparent
      # how the logic of the game operates. 
      begin
        @player1.take_turn(@board)
        @player2.take_turn(@board)
      rescue IllegalMove => e
        puts e.message
      end
    end

    game_over
  end

  def winner?
    @board.check_mate?(:white) || @board.check_mate?(:black)
  end

  def startup
    puts "Welcome to Chess"
    @board.board_setup
    @board.display
  end

  def game_over
    puts "You quitter." unless winner?
    puts @board.check_mate?(:white) ? "Black wins!" : "White wins!"
  end

end

a = Chessgame.new
a.run