

class Game
  attr_accessor :board, :move, :turn_count, :last_col, :last_row, :player
    P1 = "\u{1F535}"
    P2 = "\u{1F534}"
    BLANK = "\u{26AB}"
  def initialize
    @board = Array.new(7) { Array.new(6) { BLANK }}
    @move = 0
    @turn_count = 0
    @last_col = 0
    @last_row = 0
    @player = 0
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
    p "  0| #{board[0][0]} #{board[1][0]} #{board[2][0]} #{board[3][0]} #{board[4][0]} #{board[5][0]} #{board[6][0]}  |"
    p "  1| #{board[0][1]} #{board[1][1]} #{board[2][1]} #{board[3][1]} #{board[4][1]} #{board[5][1]} #{board[6][1]}  |"
    p "  2| #{board[0][2]} #{board[1][2]} #{board[2][2]} #{board[3][2]} #{board[4][2]} #{board[5][2]} #{board[6][2]}  |"
    p "  3| #{board[0][3]} #{board[1][3]} #{board[2][3]} #{board[3][3]} #{board[4][3]} #{board[5][3]} #{board[6][3]}  |"
    p "  4| #{board[0][4]} #{board[1][4]} #{board[2][4]} #{board[3][4]} #{board[4][4]} #{board[5][4]} #{board[6][4]}  |"
    p "  5| #{board[0][5]} #{board[1][5]} #{board[2][5]} #{board[3][5]} #{board[4][5]} #{board[5][5]} #{board[6][5]}  |"
    p "      1  2  3  4  5  6  7 "
  end
  def next_round

    @turn_count += 1
        puts "round #{@turn_count}"
  end


  def player_move
    puts "please enter a number 1-7 to place piece in a column. or enter q to quit"
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
      @last_col = col
      @last_row = row      
      @player = if @turn_count.even?
        P1
      else
        P2
      end
      @board[col][row] = @player
  end


  def vertical_win?
    player_count = 0
    analysis_array = @board[@last_col]

    analysis_array.each do |item|
      if player_count == 4
        break
      elsif item == @player
        player_count += 1
      else
        player_count = 0
      end
    end
    player_count
  end

  def horizontal_win?
    player_count = 0
    analysis_array = []
    row = @last_row
    col = 0    
    7.times do 
      analysis_array << @board[col][row]
      col += 1
    end

    analysis_array.each do |item|
      if player_count == 4
        break
      elsif item == @player
        player_count += 1
      else
        player_count = 0
      end
    end
      player_count
  end

  def diagonal_fwd_win?
  # /
  player_count = 0
  analysis_array = []
  row = @last_row
  col = @last_col
  counter = (1 + col)

      counter.times do 
        analysis_array << @board[col][row]
        col -= 1
        row += 1
      end

    analysis_array.each do |item|
      if player_count == 4
        break
      elsif item == @player
        player_count += 1
      else
        player_count = 0
      end
    end
      player_count
  end

  def diagonal_bk_win?
  # \
    player_count = 0
    analysis_array = []
    row = @last_row
    col = @last_col
    counter = (7 - col)
  
      counter.times do 
        analysis_array << @board[col][row]
        col += 1
        row += 1
      end

    analysis_array.each do |item|
      if player_count == 4
        break
      elsif item == @player
        player_count += 1
      else
        player_count = 0
      end
    end
      player_count
  end

  def game_over?
    if @turn_count <= 6 
      return false
    else

    return true if (vertical_win? == 4) || (horizontal_win? == 4) || (diagonal_fwd_win? == 4) || (diagonal_bk_win? == 4) || @turn_count == 42 
      false
    end
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
    @turn_count = 0
    @last_col = 0
    @last_row = 0
    @player = 0
  end
end