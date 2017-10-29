require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :current_player, :player1, :player2, :board, :mark

  def initialize(player1, player2)
    @board = Board.new
    @player1, @player2 = player1, player2
    player1.mark = :X
    player2.mark = :O
    @current_player = player1
  end

  def play_turn
    board.place_mark(current_player.get_move, current_player.mark)
    switch_players!
  end

  def switch_players!
    self.current_player = current_player == player1 ? player2 : player1
  end
end

if $PROGRAM_NAME == __FILE__

  print "Enter your name: "
  name = gets.chomp.strip
  human = HumanPlayer.new(name)
  garry = ComputerPlayer.new('garry')

  new_game = Game.new(human, garry)
  new_game.play
end
