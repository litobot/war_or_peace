require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
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

  def winner
    # if the turn has a type of :basic
      # it will return whichever player has a higher rank_of_card_at(0)
        # get rank of card @ index [0] for each player
          # figure out which one is higher
            # return that player as winner

      if type == :basic
        player_ranks_array = [player1.deck.rank_of_card_at(0), player2.deck.rank_of_card_at(0)]
        winning_index = player_ranks_array.find_index(player_ranks_array.max)
        # Line 46 is finding the index number of highest rank in the player_ranks_array
        # Line 45 is an array of two ranks
        # One of those ranks belongs to player1
        # And it is in position 0
        # The other rank belongs to player2
        # And it is in position 1
        if winning_index == 0
          @player1
        elsif winning_index == 1
          @player2
        end
      end

    end

    def pile_cards
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player2.deck.remove_card
    end
    
    def award_spoils(winner)
      # this method will add each of the cards in the @spoils_of_war 
      # array to the winner of the turn.
      spoils_of_war.each do |card|
        winner.deck.add_card(card)
      end
    end
  end

  
  # this #max returns the higher rank between player1 & player2's deck
  # I need to have a way to know who's deck that higher card came from
  # I need to compare the card with the highest rank as returned from #max including
    # it's associated suit and value against each player's deck
      # if all attributes match a player's deck, that affiliated player is returned
  
# winner: this method will determine the winner of the turn.
# if the turn has a type of :war the winner will be whichever player has a higher rank_of_card_at(2)
# if the turn has a type of :mutually_assured_destruction the method will return No Winner.


def winner
  case @turn
  when :basic
    return @player1 if rank_of_card_at(0, @player1) > rank_of_card_at(0, @player2)
    return @player2 if rank_of_card_at(0, @player1) < rank_of_card_at(0, @player2)
  when :war
    return @player1 if rank_of_card_at(2, @player1) > rank_of_card_at(2, @player2)
    return @player2 if rank_of_card_at(2, @player1) < rank_of_card_at(2, @player2)
  when :mutually_assured_destruction
    return "No Winner"
  end
  nil # Default case, if the turn type is not recognized or if it's a tie
end