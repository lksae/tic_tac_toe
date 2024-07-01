# frozen_string_literal: true

# Player class to track the actions of the players
class Player
  attr_accessor :type, :selected_fields, :winner_array

  def initialize(type)
    self.type = type
    self.selected_fields = []
    self.winner_array = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  end

  def get_field_selection(selected_field)
    selected_fields.push(selected_field)
  end

  def check_win
    outcome = false
    return unless selected_fields.length >= 3

    winner_array.each do |sub_array|
      outcome = true if (sub_array - selected_fields).empty?
    end
    outcome
  end
end
