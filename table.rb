class Table
	
	attr_accessor :cards

	def initialize
		@cards = []
	end

	def put_card(card)
		cards << card
	end

	def put_cards(cs)
		cards.concat cs
	end

	def card_names
		cards.map(&:to_s).join " "
	end

end
