require "byebug"

class Board

  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def self.print_grid(grid_arr)
    grid_arr.each do |sub_arr|
      row_str = ""
      sub_arr.each { |el| row_str += el.to_s + " " }
      puts "#{row_str[0...-1]}"
    end
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end

  def num_ships
    @grid.inject(0) do |acc_1, sub_arr|
      acc_1 += sub_arr.inject(0) { |acc_2, el| el == :S ? acc_2 += 1 : acc_2 }
    end
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      puts "you sunk my battleship!"
      return true
    else
      self[pos] = :X
      return false
    end
  end

  def place_random_ships
    pos_arr = []
    until pos_arr.uniq.count >= @size * 0.25
      pos_arr << [rand(@grid.length-1), rand(@grid.length-1)]
    end
    pos_arr.uniq.each { |pos| self[pos] = :S }
  end

  def hidden_ships_grid
    @grid.map do |sub_arr|
      sub_arr.map { |el| el == :S ? :N : el }
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end

end












