# blackjack_score.rb

# deck = %w[ 2 3 4 5 6 7 8 9 10 Jack Queen King Ace ]

# card_count = rand(2..5)

# hand = deck.shuffle.pop(card_count)

def blackjack_score(hand)
  allowed_cards = %w[ 2 3 4 5 6 7 8 9 10 Jack Queen King Ace ]

# Validate input
  if hand.length > 5
    raise ArgumentError.new("Your hand contains more than 5 cards.")
  end 

  result = hand.all? {|card| allowed_cards.include?(card)}
  if !result
    raise ArgumentError.new("Invalid card value.")
  end 

# Calculate score 
  score = 0
  hand.each do |card|
    if card.length <= 2
      points = card.to_i
      score += points
    elsif card.length == 3 
      score += 1
    else 
      score += 10    
    end 
  end

  if score <= 11 && hand.include?("Ace")
    score += 10
  end

# Validate result
  if score > 21
    raise ArgumentError.new("#{score} is greater than 21, you lose!")
  end

   return score 
end 