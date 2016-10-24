require 'spec_helper'
require './poker'

describe Poker do

	before do
		@poker = Poker.new
	end

	it do
		expect(@poker.deck).to be_kind_of Deck
		expect(@poker.table).to be_kind_of Table
		expect(@poker.players.length).to eq 3
	end

	context '#distribution_cards_to_players' do
		it do
			expect { @poker.send :distribution_cards_to_players }.to change { [@poker.players[0].cards.length, @poker.players[1].cards.length, @poker.players[2].cards.length] }.from([0,0,0]).to([2,2,2])
		end
	end

	context '#distribution_cards_table_flop' do
		it do
			expect { @poker.send :distribution_cards_table_flop }.to change { @poker.table.cards.length }.from(0).to(3)
		end
	end

	context '#distribution_cards_table_turn' do
		before { @poker.send :distribution_cards_table_flop }
		it do
			expect { @poker.send :distribution_cards_table_turn }.to change { @poker.table.cards.length }.from(3).to(4)
		end
	end

	context '#distribution_cards_table_river' do
		before do
			@poker.send :distribution_cards_table_flop
			@poker.send :distribution_cards_table_turn
		end
		it do
			expect { @poker.send :distribution_cards_table_river }.to change { @poker.table.cards.length }.from(4).to(5)
		end
	end

end
