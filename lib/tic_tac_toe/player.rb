# lib/tic_tac_toe/player.rb
# Creates and tracks player's names

module TicTacToe
  class Player
    attr_reader :name, :color

    # expects a hash input with name and color
    def initialize(input)
      @name = input.fetch(:name)
      @color = input.fetch(:color)
    end
  end
end