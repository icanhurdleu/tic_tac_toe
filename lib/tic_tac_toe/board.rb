# lib/tic_tac_toe/board.rb
# Initializes and creates the board
# Also keeps track of each cell within the board

module TicTacToe
  class Board
    attr_reader :grid

    # expects a hash with the key :grid
    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
    end

    def get_cell(x, y)
      grid[y][x]
    end

    def set_cell(x, y, value)
      get_cell(x, y).value = value
    end

    def game_over
      return :winner if winner?
      return :draw if draw?
      false
    end

    private

    def default_grid
      Array.new(3) { Array.new(3) { Cell.new } }
    end

    def draw?
      grid.flatten.map { |cell| cell.value }.none_empty?
    end

    def winner?
      winning_positions.each do |positions|
        next if position_values(positions).all_empty?
        return true if position_values(positions).all_same?
      end
      false
    end

    def position_values(winning_positions)
      winning_positions.map { |cell| cell.value }
    end


    def winning_positions
      grid + # rows
      grid.transpose + # columns
      diagonals
    end

    def diagonals
      [[get_cell(0,0), get_cell(1,1), get_cell(2,2)],
       [get_cell(0,2), get_cell(1,1), get_cell(2,0)]]
    end
  end
end