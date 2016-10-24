require 'spec_helper'
require './combination_checker'


describe CombinationChecker::Straight do

	before do
		@cards = [
			create_cards_list(%w(2H 3D 4C 5S 6D)),
			create_cards_list(%w(AC 2H 3D 4C 5S)),
			create_cards_list(%w(2S 3H 5C 7H 9D))
		]

		@results = [
			{ type: "Straight", cards: @cards[0], combination_weight: 4, weight: 5 },
			{ type: "Straight", cards: @cards[1], combination_weight: 4, weight: 0 },
			false
		]
	end

	it_should_behave_like 'combination_checkable'

end
