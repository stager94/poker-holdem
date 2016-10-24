require 'spec_helper'
require './combination_checker'


describe CombinationChecker::Flush do

	before do
		@cards = [
			create_cards_list(%w(2H 5H 9H JH AH)),
			create_cards_list(%w(2H 5H 9H TH AH)),
			create_cards_list(%w(2S 3H 5C 7H 9D))
		]

		@results = [
			{ type: "Flush", cards: @cards[0], combination_weight: 6, weight: 1310080401 },
			{ type: "Flush", cards: @cards[1], combination_weight: 6, weight: 1309080401 },
			false
		]
	end

	it_should_behave_like 'combination_checkable'

end
