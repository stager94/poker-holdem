require 'spec_helper'
require './combination_checker'


describe CombinationChecker::OnePair do

	before do
		@cards = [
			create_cards_list(%w(2S 2H 5C AH JD)),
			create_cards_list(%w(2S 3H 5C JH JD)),
			create_cards_list(%w(2S 3H 5C 7H 9D))
		]

		@results = [
			{ type: "Pair", cards: @cards[0], combination_weight: 1, weight: 1131004 },
			{ type: "Pair", cards: @cards[1], combination_weight: 1, weight: 10040201 },
			false
		]
	end

	it_should_behave_like 'combination_checkable'

end
