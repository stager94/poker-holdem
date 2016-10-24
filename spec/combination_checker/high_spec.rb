require 'spec_helper'
require './combination_checker'


describe CombinationChecker::High do

	before do
		@cards = [
			create_cards_list(%w(2S 3H 5C AH JD)),
			create_cards_list(%w(2S 3H 5C JH TD))
		]

		@results = [
			{ type: "High", cards: @cards[0], combination_weight: 0, weight: 13 },
			{ type: "High", cards: @cards[1], combination_weight: 0, weight: 10 }
		]
	end

	it_should_behave_like 'combination_checkable'

end
