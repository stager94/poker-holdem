require 'spec_helper'
require './combination_checker'


describe CombinationChecker::TwoPair do

	before do
		@cards = [
			create_cards_list(%w(2S 2H 5C 5H JD)),
			create_cards_list(%w(2S 5H 5C JH JD)),
			create_cards_list(%w(2S 3H 5C 7H 9D))
		]

		@results = [
			{ type: "Two Pair", cards: @cards[0], combination_weight: 2, weight: 40110 },
			{ type: "Two Pair", cards: @cards[1], combination_weight: 2, weight: 100401 },
			false
		]
	end

	it_should_behave_like 'combination_checkable'

end
