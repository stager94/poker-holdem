require 'spec_helper'
require './combination_checker'


describe CombinationChecker::ThreeOfKind do

	before do
		@cards = [
			create_cards_list(%w(2S 2H 2C 5H JD)),
			create_cards_list(%w(2S 5H JC JH JD)),
			create_cards_list(%w(2S 3H 5C 7H 9D))
		]

		@results = [
			{ type: "Three of a Kind", cards: @cards[0], combination_weight: 3, weight: 11004 },
			{ type: "Three of a Kind", cards: @cards[1], combination_weight: 3, weight: 100401 },
			false
		]
	end

	it_should_behave_like 'combination_checkable'

end
