# frozen_string_literal: true

# Game to display the board and process the players choice
class Game
  attr_accessor :gameboard

  def initialize
    self.gameboard = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def show_board
    gameboard.each do |row|
      p row
    end
  end
end
