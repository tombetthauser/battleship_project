class Player

  def get_move
    print "Please enter a position with coordinates separeted with a space: "
    input = gets.chomp.split(" ").map { |el| el.to_i }
    print "\n"
    until input.count == 2
      print "That is not a valid entry. Please enter a position with coordinates separeted with a space: "
      input = gets.chomp.split(" ").map { |el| el.to_i }
      print "\n"
    end
    system "clear"
    input
  end

end
