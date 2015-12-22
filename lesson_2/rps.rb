WINNING_SCENARIOS = { 'rock' => %w(scissors lizard),
                      'paper' => %w(rock spock),
                      'scissors' => %w(lizard paper),
                      'lizard' => %w(paper spock),
                      'spock' => %w(rock scissors)
 }

def prompt(message)
  puts "=> #{message}"
end

def winner_name(player, computer)
  players = [player, computer]
  winner = nil
  WINNING_SCENARIOS.each do |choice, defeated|
    next if !players.include?(choice) || (players & defeated).empty?
    winner = (choice == player ? 'you' : 'computer')
  end
  winner
end

def game_over?(player_score, computer_score)
  rounds_to_win = 5
  (player_score == rounds_to_win) || (computer_score == rounds_to_win)
end

def scores(player_score, computer_score)
  "Player's score: #{player_score} Computer's score: #{computer_score}"
end

def display_results(winner, player_score, computer_score)
  prompt(scores(player_score, computer_score))
  if game_over?(player_score, computer_score)
    prompt("Game over! #{winner} won 5 rounds")
  elsif winner
    prompt("#{winner} won!")
  else
    prompt("It's a tie!")
  end
end

def player_turn
  loop do
    prompt("Choose one: #{WINNING_SCENARIOS.keys.join(', ')}")
    choice = gets.chomp

    if choice == 's'
      prompt("Did you mean scissors or spock? use sp/sc")
      next
    end
    choice = WINNING_SCENARIOS.keys.detect { |winning_choice| winning_choice.start_with?(choice) }

    if WINNING_SCENARIOS.keys.include?(choice)
      return choice
    else
      prompt("That's not a valid choice.")
    end
  end
end

def computer_turn
  WINNING_SCENARIOS.keys.sample
end

loop do
  system 'clear'
  player_score = 0
  computer_score = 0

  until game_over?(player_score, computer_score)
    player_choice = player_turn
    computer_choice = computer_turn
    winner = winner_name(player_choice, computer_choice)

    if winner == 'you'
      player_score += 1
    elsif winner == 'computer'
      computer_score += 1
    end

    system 'clear'
    puts "You chose: #{player_choice}; Computer chose: #{computer_choice}"
    display_results(winner, player_score, computer_score)
  end

  prompt("would you like to play again? (Y/N)")
  break if gets.chomp.downcase.start_with?('n')
end

prompt("Thanks for playing. Good Bye!")
