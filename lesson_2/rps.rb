WINNING_SCENARIOS = { 'rock' => 'scissors', 'paper' => 'rock', 'scissors' => 'paper' }

def prompt(message)
  puts "=> #{message}"
end

def display_results(player, computer)
  if player == computer
    prompt("It's a tie!")
  else
    WINNING_SCENARIOS.each do |winner, loser|
      next if ([winner, loser] & [player, computer]).size < 2
      prompt("#{(winner == player ? 'You' : 'Computer')} won!")
    end
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{WINNING_SCENARIOS.keys.join(', ')}")
    choice = gets.chomp

    if WINNING_SCENARIOS.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  computer_choice = WINNING_SCENARIOS.keys.sample

  puts "You chose: #{choice}; Computer chose: #{computer_choice}"

  display_results(choice, computer_choice)

  prompt("would you like to play again? (Y/N)")
  break if gets.chomp.downcase.start_with?('n')
end

prompt("Thanks for playing. Good Bye!")
