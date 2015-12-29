WINNING_LINES = [[*1..3], [*4..6], [*7..9]] + # rowes
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagnals
PLAYER_MARKER = 'x'
COMPUTER_MARKER = 'o'
EMPTY_SQUARE = '-'

# UI methods

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system 'clear'
end

def progress(msg)
  print msg.capitalize + ' '
  4.times do
    print '.'
    sleep 0.5
  end
end

# board methods

def init_board
  new_board = {}
  9.times { |num| new_board[num + 1] = EMPTY_SQUARE }
  new_board
end

def draw_board(board)
  clear_screen
  board.values.each_slice(3).with_index do |line, index|
    puts line.join ' | '
    puts '-' * 9 unless index == 2
  end
end

def empty_squares(board)
  board.keys.select { |num| board[num] == EMPTY_SQUARE }
end

# players

def player_move!(board)
  valid_move = empty_squares(board)
  move = ''

  loop do
    puts "pick one of these empty squares (#{valid_move.join(', ')})"
    move = gets.chomp.to_i

    break if valid_move.include?(move)
    puts "#{move} isn't an empty squares."
  end
  board[move] = PLAYER_MARKER
end

def computer_move!(board)
  board[empty_squares(board).sample] = COMPUTER_MARKER
end

# outcome
def game_over?(board)
  empty_squares(board).empty? || winner?(board)
end

def winner?(board)
  detect_winner(board)
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    board_line = board.values_at(*line)
    if board_line.count(PLAYER_MARKER) == 3
      return 'Player'
    elsif board_line.count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def display_results(board)
  draw_board(board)
  progress("Game over")
  clear_screen
  if winner?(board)
    prompt("#{detect_winner(board)} won!")
  else
    prompt("it's a tie!")
  end
end

loop do
  clear_screen
  progress("Drawing the board")
  board = init_board

  loop do
    draw_board(board)

    player_move!(board)
    break if game_over?(board)

    computer_move!(board)
    break if game_over?(board)
  end

  display_results(board)

  prompt("Play again? (Y/N)")
  break unless gets.chomp.downcase.start_with?('y')
end

prompt("Thanks for playing. Good bye!")
