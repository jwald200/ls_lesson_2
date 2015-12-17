WINNING_SCENARIOS = { 'rock' => %w(scissors lizard),
                      'paper' => %w(rock spock),
                      'scissors' => %w(lizard paper),
                      'lizard' => %w(paper spock),
                      'spock' => %w(rock scissors)
 }

def prompt(message)
  puts "=> #{message}"
end

def display_results(player, computer)
  if player == computer
    prompt("It's a tie!")
  else
    WINNING_SCENARIOS.each do |winner, loser|
      players = [player, computer]
      next if !players.include?(winner) || (players & loser).empty?
      prompt("#{(winner == player ? 'You' : 'Computer')} won!")
    end
  end
end

loop do
  choice = ''

  loop do
    prompt("Choose one: #{WINNING_SCENARIOS.keys.join(', ')}")
    choice = gets.chomp
    if choice == 's'
      prompt("Did you mean scissors or spock? use sp/sc")
      next
    end
    choice = WINNING_SCENARIOS.keys.detect { |winner| winner.start_with?(choice)}

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
