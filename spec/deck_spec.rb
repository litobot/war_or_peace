require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Deck do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)  
    card3 = Card.new(:heart, 'Ace', 14)
    
    expect(card1).to be_an_instance_of(Card)
    expect(card2).to be_an_instance_of(Card)
    expect(card3).to be_an_instance_of(Card)
  end
  
  it "can store cards in an array" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)  
    card3 = Card.new(:heart, 'Ace', 14)
    
    cards = [card1, card2, card3]
    
    deck = Deck.new(cards)
    
    expect(deck.cards).to eq([card1, card2, card3])
  end
  
  it "returns card rank via array indices" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)  
    card3 = Card.new(:heart, 'Ace', 14)
    
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end

  it "returns high ranking cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)  
    card3 = Card.new(:heart, 'Ace', 14)
    
    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    
    expect(deck.high_ranking_cards).to eq([card1, card3])
  end
  
  it "it returns the percentage of high ranking cards in a deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)  
    card3 = Card.new(:heart, 'Ace', 14)
    
    cards = [card1, card2, card3]
  
    deck = Deck.new(cards)
    
    expect(deck.percent_high_ranking).to eq(66.67)
  end
  
  it "can remove a card from a deck" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)  
    card3 = Card.new(:heart, 'Ace', 14)
    
    cards = [card1, card2, card3]
  
    deck = Deck.new(cards)

    expect(deck.remove_card).to eq(card1)
    expect(deck.cards).to eq([card2, card3])
    expect(deck.high_ranking_cards).to eq([card3])
    expect(deck.percent_high_ranking).to eq(50.0)
  end

end

  # pry(main)> deck.percent_high_ranking
  # #=> 50.0

  # pry(main)> card4 = Card.new(:club, '5', 5)
  # #=> #<Card:0x007fbfd2963978 @rank=5, @suit=:club, @value="5">

  # pry(main)> deck.add_card(card4)

  # pry(main)> deck.cards
  # #=> [#<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>, #<Card:0x007fbfd2963978...>]

  # pry(main)> deck.high_ranking_cards
  # #=> [#<Card:0x007fbfd18555a0...>]

  # pry(main)> deck.percent_high_ranking
  # #=> 33.33