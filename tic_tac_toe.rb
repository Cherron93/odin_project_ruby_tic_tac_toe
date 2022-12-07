# frozen_string_literal: true

# class for TicTacToe game
class TicTacToe
  @moves = %w[X O]

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @players = [@player_one, @player_two]
    @current_player = 0
    create_grid
    @game_over = false
    display_grid
    player_move
  end

  # Create new empty tic tac toe board
  def create_grid
    @row_a = [' ', ' ', ' ']
    @row_b = [' ', ' ', ' ']
    @row_c = [' ', ' ', ' ']
  end

  # Take player moves
  def player_move
    if @game_over == false
      p "current player = #{@current_player}"
      puts "Make your move #{@players[@current_player.to_i]}! First pic your row (A, B, or C)"
      row = gets.chomp
      puts 'Now pick your column (1, 2, 3)'
      column = gets.chomp
      grid_update(row, column)
      display_grid
      switch_player
      player_move
    else
      puts "Game over! #{@players[@current_player.to_i]} wins!"
    end
  end

  # change player
  def switch_player
    if @current_player == 0
      @current_player = 1
    elsif @current_player == 1
      @current_player = 0
    end
  end

  # Update grid based on player move
  def grid_update(row, column)
    p @current_player
    if %w[a A].include?(row) && row == ' '
      @row_a[column.to_i - 1] = @moves[@current_player]
    elsif %w[b B].include?(row) && row == ' '
      @row_b[column.to_i - 1] = @moves[@current_player]
    elsif %w[c C].include?(row) && row == ' '
      @row_c[column.to_i - 1] = @moves[@current_player]
    else
      puts 'Not a valid move - try again'
    end
  end

  # Checks board to verify when game should end
  def score_checker
    if @row_a == %w[X X X] || @row_a == %w[O O O]
      @game_over = true
    elsif @row_b == %w[X X X] || @row_b == %w[O O O]
      @game_over = true
    elsif @row_c == %w[X X X] || @row_b == %w[O O O]
      @game_over = true
    elsif @row_a[0] == 'X' && @row_b[1] == 'X' && @row_c[2] == 'X'
      @game_over = true
    elsif @row_a[2] == 'X' && @row_b[1] == 'X' && @row_c[0] == 'X'
      @game_over = true
    elsif @row_a[0] == 'O' && @row_b[1] == 'O' && @row_c[2] == 'O'
      @game_over = true
    elsif @row_a[2] == 'O' && @row_b[1] == 'O' && @row_c[0] == 'O'
      @game_over = true
    end
  end

  # Display tic_tac_toe board
  def display_grid
    p @row_a
    p @row_b
    p @row_c
    score_checker
  end
end

game = TicTacToe.new('steve', 'randy')
