require 'spec_helper'
require './combination_checker'


describe CombinationChecker::StraightFlush do

	before do
		@cards = [
			create_cards_list(%w(9H TH JH QH KH)),
			create_cards_list(%w(8H 9H TH JH QH)),
			create_cards_list(%w(2S 3H 5C 7H 9D))
		]

		@results = [
			{ type: "Straight Flush", cards: @cards[0], combination_weight: 8, weight: 12 },
			{ type: "Straight Flush", cards: @cards[1], combination_weight: 8, weight: 11 },
			false
		]
	end

	it_should_behave_like 'combination_checkable'

end
