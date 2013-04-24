# encoding: utf-8

def Chessgame

  def attr_accessor :board

  def initialize
    @board = Board.new()
    @player1 = HumanPlayer.new
    @player2 = HumanPlayer.new
  end


  def run
    hello

    until winner? || quit?
      turn(@player1)
      @board.display
      turn(@player2)
      @board.display
    end

    game_over
  end

  def winner?
  end

  def quit?
  end

  def turn
    [start_pos, end_pos] = get_input
    update_board(start_pos, end_pos)
  end

  def get_input
  end

  def update_board
  end

end