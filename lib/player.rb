class Player

  def get_move
    print "enter a position with coordinates separeted with a space like '4 7'"
    gets.chomp.split(" ").map { |el| el.to_i }
  end

end
