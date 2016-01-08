SUITS = %w(H D S C)
VALUES = [*'2'..'10'] + %w(J Q K A)
VALUES_TO_WIN = 21
DEALER_MIN_HIT = 17
GAME_WIN = 5

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

def in_progress_indicator(msg)
  print msg.capitalize + ' '
  4.times do
    print '.'
    sleep 0.3
  end
  puts
end

def init_deck
  SUITS.product(VALUES).shuffle
end

def deal_card!(player_hand, deck)
  player_hand << deck.pop
end

def total(hand)
  sum = 0

  hand.each do |card|
    value = card[1]

    sum += case value
           when '2'..'10' then value.to_i
           when 'A' then 11
           else; 10
           end
  end

  adjust_aces(hand, sum)
end

def adjust_aces(hand, sum)
  hand.flatten.count('A').times { sum -= 10 if sum > VALUES_TO_WIN }
  sum
end

def deal_initial_cards!(player_hand, dealer_hand, deck)
  2.times do
    deal_card!(player_hand, deck)
    deal_card!(dealer_hand, deck)
  end
end

def hit_or_stay
  choice = nil
  loop do
    prompt "Would you like to (h)it or (s)tay?"
    choice = gets.chomp.downcase
    break if %w(h s).include?(choice)
    prompt "Sorry, must enter 'h' or 's'."
  end

  choice
end

def player_turn(player_hand, deck)
  loop do
    break if total(player_hand) >= VALUES_TO_WIN || hit_or_stay == 's'

    deal_card!(player_hand, deck)
    in_progress_indicator("dealing a card to you")
    clear_screen
    display_participant_hand(player_hand, 'You')
  end

  prompt "You chose to stay." if total(player_hand) < VALUES_TO_WIN
end

def dealer_turn(dealer_hand, deck)
  prompt 'dealer turn'
  loop do
    break if total(dealer_hand) >= DEALER_MIN_HIT
    deal_card!(dealer_hand, deck)
    in_progress_indicator("dealing a card to you")
    clear_screen
    display_participant_hand(dealer_hand, 'Dealer')
  end
end

def display_deck(player_hand, dealer_hand, game_over=false)
  clear_screen
  if game_over
    prompt "Dealer has #{dealer_hand}, for a total of: #{total(dealer_hand)}"
  else
    prompt "Dealer has #{dealer_hand[0]} and ?"
  end
  prompt "You have: #{player_hand}, for a total of #{total(player_hand)}."
  puts '=' * 15
end

def display_participant_hand(hand, participant_name)
  prompt "#{participant_name} have: #{hand}, for a total of #{total(hand)}."
end

def determine_outcome(player_hand, dealer_hand)
  player_total = total(player_hand)
  dealer_total = total(dealer_hand)

  if player_total > VALUES_TO_WIN
    :player_busted
  elsif dealer_total > VALUES_TO_WIN
    :dealer_busted
  elsif player_total < dealer_total
    :dealer
  elsif player_total > dealer_total
    :player
  else
    :tie
  end
end

def display_results(dealer_hand, player_hand)
  result = determine_outcome(dealer_hand, player_hand)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def display_score(score)
  puts '-' * 20
  prompt "Your score: #{score}"
end

def won_game?(score)
  score == GAME_WIN
end

def play_again?
  puts "#{'-' * 20}"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

score = 0
prompt "Welcome to Twenty-one!\n\n"

loop do
  deck = init_deck
  player_hand = []
  dealer_hand = []

  in_progress_indicator("dealing the cards")
  deal_initial_cards!(player_hand, dealer_hand, deck)
  display_deck(player_hand, dealer_hand)

  player_turn(player_hand, deck)
  dealer_turn(dealer_hand, deck) if total(player_hand) < VALUES_TO_WIN

  in_progress_indicator("game over")
  display_deck(player_hand, dealer_hand, 'game_over')
  display_results(player_hand, dealer_hand)

  outcome = determine_outcome(player_hand, dealer_hand)
  score += 1 if outcome == :player || outcome == :dealer_busted

  display_score(score)

  prompt "you won #{GAME_WIN} rounds." if won_game?(score)

  break if won_game?(score) || !play_again?
end
