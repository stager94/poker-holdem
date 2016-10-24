require 'spec_helper'
require './combination_checker'


describe CombinationChecker::FourOfKind do

	before do
		@cards = [
			create_cards_list(%w(7H JH JC JD JS)),
			create_cards_list(%w(6H JH JC JD JS)),
			create_cards_list(%w(2S 3H 5C 7H 9D))
		]

		@results = [
			{ type: "Four of a Kind", cards: @cards[0], combination_weight: 7, weight: 1006 },
			{ type: "Four of a Kind", cards: @cards[1], combination_weight: 7, weight: 1005 },
			false
		]
	end

	it_should_behave_like 'combination_checkable'

end
