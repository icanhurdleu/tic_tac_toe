# Play Tic Tac Toe

require_relative "../lib/tic_tac_toe.rb"

puts "Welcome to Tic Tac Toe"
p1 = TicTacToe::Player.new({name: "Player 1", color: "X"})
p2 = TicTacToe::Player.new({name: "Player 2", color: "O"})
players = [p1, p2]

TicTacToe::Game.new(players).play