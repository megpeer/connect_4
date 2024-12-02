

class Game
  attr_accessor :board, :move, :turn_count
    P1 = "\u{1F535}"
    P2 = "\u{1F534}"
    BLANK = "\u{26AB}"
  def initialize
    @board = Array.new(7) { Array.new(6) { BLANK }}
    @move = 0
    @turn_count = 0
    @game_over = 0
  end

  def play_game
    display_board
    play_round until game_over?
    game_over_message
    return unless reset?
    reset
    play_game
  end

  def play_round
    player_move
    place_move
    next_round
    display_board
  end

  def display_board
    p "  | #{board[0][0]} #{board[1][0]} #{board[2][0]} #{board[3][0]} #{board[4][0]} #{board[5][0]} #{board[6][0]}  |"
    p "  | #{board[0][1]} #{board[1][1]} #{board[2][1]} #{board[3][1]} #{board[4][1]} #{board[5][1]} #{board[6][1]}  |"
    p "  | #{board[0][2]} #{board[1][2]} #{board[2][2]} #{board[3][2]} #{board[4][2]} #{board[5][2]} #{board[6][2]}  |"
    p "  | #{board[0][3]} #{board[1][3]} #{board[2][3]} #{board[3][3]} #{board[4][3]} #{board[5][3]} #{board[6][3]}  |"
    p "  | #{board[0][4]} #{board[1][4]} #{board[2][4]} #{board[3][4]} #{board[4][4]} #{board[5][4]} #{board[6][4]}  |"
    p "  | #{board[0][5]} #{board[1][5]} #{board[2][5]} #{board[3][5]} #{board[4][5]} #{board[5][5]} #{board[6][5]}  |"
    p "     1  2  3  4  5  6  7 "
  end

  def player_move
    puts "please enter a number 1-7 to place piece in a row. or enter q to quit"
    move = gets.to_s.chomp
    if move == "q"
      puts "exiting program"
      abort
    else
      @move = move[0].to_i
    puts "player entered #{@move}"
    valid_move
    end
  end

  def valid_move
    if @move.between?(1, 7)
      column_full?
    
    else
      puts "invalid move"
      player_move 
    end
  end

  def column_full?
    col = (@move - 1)
    if @board[col].include?(BLANK)
    return
    else
      puts "column is full, choose a column with room for a token."
      player_move
    end
  end


  def place_move
      col = (@move - 1)
      row = 5
      row -= 1 until @board[col][row] == BLANK

      @board[col][row] = if @turn_count.even?
        P1
      else
        P2
      end
  end

  def next_round
    @turn_count += 1
  end

  def vertical_win?
    row = 6
    col = 0

    4.times do 
      row -= 1 until @board[col][row] != BLANK
      if @board[col][row] == (@board[col][row - 1] && @board[col][row - 2] && @board[col][row - 3])
        return true
      else
        false
      end
    end
  end

  def horizontal_win?
    row = 6
    col = 6

    6.times do 
      row -= 1 until @board[col][row] != BLANK
      if @board[col][row] == (@board[col - 1][row] && @board[col - 2][row] && @board[col - 3][row])
        return true
      else
        false
      end
    end
  end

  def diagonal_fwd_win?
    row = 6
    col = 6

    4.times do 
      row -= 1 until @board[col][row] != BLANK
      if @board[col][row] == (@board[col - 1][row - 1] && @board[col - 2][row - 2] && @board[col - 3][row - 3])
        return true
      else
        false
      end
    false
    end
  end

  def diagonal_bk_win?
    row = 6
    col = 0

    4.times do 
      row -= 1 until @board[col][row] != BLANK
      if @board[col][row] == (@board[col + 1][row - 1] && @board[col + 2][row - 2] && @board[col + 3][row - 3])
        return true
      else
        false
      end
    false
    end
  end

  def diagonal_win?
    return true if diagonal_fwd_win? || diagonal_bk_win?
    false
  end

  def game_over?
    return true if @turn_count == 42 || horizontal_win? || vertical_win? || diagonal_win?
      false
  end

  def game_over_message
    puts "game over!"
  end

  def reset?
    puts "reset game? y/n"
  inpt = gets.to_s.chomp
    return true if inpt == "y"
    false
  end

  def reset
    @board = Array.new(7) { Array.new(6) { BLANK }}
    @move = 0
  end



end



#player inputs move
#if move is valid, token is placed on board.
#if move is not valid, player is prompted to input a valid move
#check updated board if 4 pieces are connected vertically, horizontally or diagonally
#if 4 pieces are connected, display winning message for that player
#repeat loop from start if win condition not met.