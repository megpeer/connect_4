

class Game
  attr_accessor :board
    P1 = "\u{1F535}"
    P2 = "\u{1F534}"
    BLANK = "\u{25EF}"
  def initialize
    @board = Array.new(6) { Array.new(7) { BLANK }}
    puts "welcome to connect four!"
    p "row 1 #{board[0].to_s.gsub('"', '')}"
    puts ""
    p "row 2 #{board[1].to_s.gsub('"', '')}"
    puts ""
    p "row 3 #{board[2].to_s.gsub('"', '')}"
    puts ""
    p "row 4 #{board[3].to_s.gsub('"', '')}"
    puts ""
    p "row 5 #{board[4].to_s.gsub('"', '')}"
    puts ""
    p "row 6 #{board[5].to_s.gsub('"', '')}"
  end


  def play_round
    player_move
    place_move
    next_round
    display_board
  end

  def play_game
    display_board
    play_round until game_over?
    game_over_message
    return unless reset?
    reset
    play_game
  end



end



#player inputs move
#if move is valid, token is placed on board.
#if move is not valid, player is prompted to input a valid move
#check updated board if 4 pieces are connected vertically, horizontally or diagonally
#if 4 pieces are connected, display winning message for that player
#repeat loop from start if win condition not met.