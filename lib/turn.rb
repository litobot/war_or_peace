require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1,
              :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def spoils_of_war
    []
  end

  def type
    # what do i have access to?
      # player, deck, cards, figure out rank at an index
        # player
          # deck
            # cards, method called rank_of_cards_at(index)
              # suit, value, rank
      # player1.deck.cards, player1.deck.rank_of_card_at(index)
      # player2.deck.cards, player2.deck.rank_of_card_at(index)
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    end
  end


  # def winner

  # end
end

# winner: this method will determine the winner of the turn.
# if the turn has a type of :basic, it will return whichever player has a higher rank_of_card_at(0)
# if the turn has a type of :war the winner will be whichever player has a higher rank_of_card_at(2)
# if the turn has a type of :mutually_assured_destruction the method will return No Winner.