class Player
  attr_reader :color

  def initialize
    #@color = color
  end

end


class HumanPlayer < Player


  def get_move
    puts "Please enter a start position x,y or q for quit:"
    raw_input = gets.chomp
    return :quit if raw_input == "q"

    start_position = raw_input.split(",").map {|el| el.to_i}
    puts "Please enter an end position"
    end_position = gets.chomp.split(",").map {|el| el.to_i}

    [start_position, end_position]
  end




end


class ComputerPlayer < Player

end