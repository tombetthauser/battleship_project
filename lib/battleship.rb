require_relative "board"
require_relative "player"
require "byebug"

class Battleship

  attr_reader :board, :player

  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = (n*n)/2
  end

  def start_game
    @board.place_random_ships
    print_num_ships
    @board.print
  end
  
  def lose?
    if @remaining_misses < 1
      print "You lose.\n\n"
      print "Press enter to exit."
      system "clear"
      true
    else
      false
    end
  end
  
  def win?
    if @board.num_ships < 1
      print "You win.\n\n"
      print "Press enter to exit."
      system "clear"
      true
    else
      false
    end
  end
  
  def game_over?
    win? || lose?
  end
  
  def turn
    move_pos = @player.get_move
    @board.attack(move_pos)
    @remaining_misses -= 1 if @board[move_pos] == :X
    @board.print

    print_num_ships; print_remaining_misses
  end

  private

  def print_num_ships
    print "\nThere are currently #{@board.num_ships} Ships on the Board.\n\n"
  end
  
  def print_remaining_misses
    print "\nYou have #{@remaining_misses} misses remaining.\n\n"
  end
  
end
