# frozen_string_literal: true

require_relative 'player'

# Game to display the board and process the players choice
class Game
  attr_accessor :gameboard, :x_player, :o_player, :game_in_progress, :rounds_played

  def initialize
    self.gameboard = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    self.x_player = Player.new('x')
    self.o_player = Player.new('o')
    self.game_in_progress = true
    self.rounds_played = 0
  end

  def show_board
    gameboard.each do |row|
      p row
    end
  end

  def adjust_gameboard(selected_field, type_of_player)
    gameboard.each_with_index do |row, row_index|
      row.each_with_index do |field, field_index|
        gameboard[row_index][field_index] = type_of_player if field == selected_field
      end
    end
  end

  def evaluate_player_choice(player)
    selected_field = gets.chomp.to_i
    player.get_field_selection(selected_field)
    adjust_gameboard(selected_field, player.type)
    p 'Congrats, you won' if player.check_win
    show_board if player.check_win
    self.game_in_progress = false if player.check_win
  end

  def greet_player_receive_input(player)
    puts "Hello player #{player.type}"
    puts 'The current status of the board'
    show_board
    puts 'Select your field: '
  end

  def play_round(player)
    greet_player_receive_input(player)
    evaluate_player_choice(player)
    self.rounds_played += 1
    self.game_in_progress = false if rounds_played == 9
    puts "It's a draw, how sad!"
    puts '-----------------------------'
  end

  def play_game
    while game_in_progress
      play_round(x_player)
      play_round(o_player) if game_in_progress
    end
  end
end
