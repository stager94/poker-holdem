require './deck'
require './table'
require './player'
require './combination_checker'
require 'pry'

class Poker

	attr_accessor :players, :deck, :table
	
	def initialize
		@deck 	 = Deck.new
		@table 	 = Table.new
		@players = registered_players
	end

	def play!
		distribution_cards_to_players

		players.each do |player|
			p "Player #{player.name} hand: #{player.card_names}"
		end
		p ""

		distribution_cards_table_flop
		p "Table on flop: #{table.card_names}"

		distribution_cards_table_turn
		p "Table on turn: #{table.card_names}"

		distribution_cards_table_river
		p "Table on river: #{table.card_names}"

		players.each {|p| p.find_highest_combination table.cards }

		players.sort_by! {|p| [p.combination[:combination_weight], p.combination[:weight]] }

		p "Player #{players.last.name} win: #{Card.names(players.last.combination[:cards])} (#{players.last.combination[:type]})"
	end

private

	def registered_players
		[
			Player.new("A"),
			Player.new("B"),
			Player.new("C")
		]
	end

	def distribution_cards_to_players
		players.each {|p| p.add_cards(deck.get_cards(2)) }
	end

	def distribution_cards_table_flop
		table.put_cards deck.get_cards(3)
	end

	def distribution_cards_table_turn
		table.put_cards deck.get_cards
	end

	def distribution_cards_table_river
		distribution_cards_table_turn
	end

end

round = Poker.new
round.play!
