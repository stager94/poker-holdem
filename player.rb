require './helper'

class Player
	include Helper

	attr_accessor :name, :cards, :combination

	def initialize(name)
		@name = name
		@cards = []
	end

	# Add cards to player's hand
	def add_cards(cs)
		cards.concat cs
	end

	def find_highest_combination(table_cards)
		combinations = table_cards.combination(3).map {|c| c.concat cards }
		successfull_combinations = []
		CombinationChecker::POSSIBLE_COMBINATIONS.each do |pc|
			break if successfull_combinations.length > 0
			combinations.each do |c|
				checker = constantize camelize("combination_checker/#{pc}")
				result = checker.check c
				successfull_combinations << result if result
			end
		end
		@combination = successfull_combinations.sort_by {|sc| [-sc[:combination_weight], -sc[:weight]] }.first
	end

	def card_names
		cards.map {|c| c.to_s }.join " "
	end

end
