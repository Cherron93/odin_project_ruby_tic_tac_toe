# frozen_string_literal: false

# class for TicTacToe game
class TicTacToe
  def initialize(player_one, player_two)
    puts 'Please note, the columns are numbered 1, 2, and 3 and the rows are labeled A, B, and C.'
    @player_one = player_one
    @player_two = player_two
    @row_a = %w[O O O]
    @row_b = %w[O O O]
    @row_c = %w[O O O]
    @game_over = false
    display_grid
    player_move
  end

  # Take user input
  def player_move
    if @game_over == false
      puts 'Make your move! First pic your row (A, B, or C)'
      row = gets.chomp
      puts 'Now pick your column (1, 2, 3)'
      column = gets.chomp
      grid_update(row, column)
      display_grid
      score_checker
      player_move
    else
      puts 'Game over!'
    end
  end

  # Update grid based on player input
  def grid_update(row, column)
    if %w[a A].include?(row) && row != 'X'
      @row_a[column.to_i - 1] = 'X'
    elsif %w[b B].include?(row) && row != 'X'
      @row_b[column.to_i - 1] = 'X'
    elsif %w[c C].include?(row) && row != 'X'
      @row_c[column.to_i - 1] = 'X'
    else
      puts 'Not a valid answer - try again'
    end
  end

  # Checks score to see when to end game
  def score_checker
    if @row_a == %w[X X X]
      @game_over = true
    elsif @row_b == %w[X X X]
      @game_over = true
    elsif @row_c == %w[X X X]
      @game_over = true
    elsif @row_a[0] == 'X' && @row_b[1] == 'X' && @row_c[2] == 'X'
      @game_over = true
    elsif @row_a[2] == 'X' && @row_b[1] == 'X' && @row_c[0] == 'X'
      @game_over = true
    end
  end

  # Display tic_tac_toe board
  def display_grid
    p @row_a
    p @row_b
    p @row_c
  end
end

game = TicTacToe.new('steve', 'randy')
