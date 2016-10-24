require 'spec_helper'
require './combination_checker'


describe CombinationChecker::FullHouse do

	before do
		@cards = [
			create_cards_list(%w(7H 7D JC JD JS)),
			create_cards_list(%w(JH JD 7C 7D 7S)),
			create_cards_list(%w(2S 3H 5C 7H 9D))
		]

		@results = [
			{ type: "Full House", cards: @cards[0], combination_weight: 6, weight: 1006 },
			{ type: "Full House", cards: @cards[1], combination_weight: 6, weight: 610 },
			false
		]
	end

	it_should_behave_like 'combination_checkable'

end
