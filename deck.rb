require './card'

class Deck
	
	attr_accessor :cards

	def initialize
		initialize_cards
	end

	# Get card from deck and give to player or put on table
	def get_card(card)
		cards.delete_if {|c| c.suit == card.suit && c.face == card.face }
		card
	end

	# Get array of cards; alias #get_card
	def get_cards(count = 1)
		get_random_cards(count).map {|card| get_card card }
	end

	# Get needed random cards from deck for subsequent action (give to player or put on table)
	def get_random_cards(count = 1)
		cards.sample(count)
	end

private

	def initialize_cards
		@cards = card_variants.map {|face, suit| Card.new(face, suit) }
	end

	# Initialize array with possible faces and suites pairs
	def card_variants
		Card::POSSIBLE_FACES.product(Card::POSSIBLE_SUITS)
	end

end
