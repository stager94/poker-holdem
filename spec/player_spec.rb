require 'spec_helper'
require './player'
require './combination_checker'

describe Player do

	before { @player = Player.new('Alex') }

	it { expect(@player.name).to eq 'Alex' }
	it { expect(@player.cards).to eq [] }

	context '#add_cards' do
		before do 
			@cards1 = create_cards_list %w(AH JS)
			@cards2 = create_cards_list %w(TD)
		end
		it 'should add cards to user' do
			expect { @player.add_cards(@cards1) }.to change { @player.cards }.from([]).to @cards1
			expect { @player.add_cards(@cards2) }.to change { @player.cards }.from(@cards1).to @cards1+@cards2
		end
	end

	context '#card_names' do
		before { @player.cards = create_cards_list(%w(AH JS)) }
		it { expect(@player.card_names).to eq "AH JS" }
	end

	context '#find_highest_combination' do

		before { @player.cards = create_cards_list %w(AH JH) }

		context 'player without any combination' do
			before { @table_cards = create_cards_list %w(2H 3S 4C 5D 6H) }
			it { expect(@player.find_highest_combination(@table_cards)[:type]).to eq "High" }
		end

		context 'player with One Pair combination' do
			before { @table_cards = create_cards_list %w(AS 3S 4C 5D 6H) }
			it { expect(@player.find_highest_combination(@table_cards)[:type]).to eq "Pair" }
		end

		context 'player with Two Pair combination' do
			before { @table_cards = create_cards_list %w(AS JS 4C 5D 6H) }
			it { expect(@player.find_highest_combination(@table_cards)[:type]).to eq "Two Pair" }
		end

		context 'player with Three of a kind combination' do
			before { @table_cards = create_cards_list %w(JD JH 4C 5D 6H) }
			it { expect(@player.find_highest_combination(@table_cards)[:type]).to eq "Three of a Kind" }
		end

		context 'player with Flush combination' do
			before { @table_cards = create_cards_list %w(2H 3H 4H 5H 6H) }
			it { expect(@player.find_highest_combination(@table_cards)[:type]).to eq "Flush" }
		end

		context 'player with Full house combination' do
			before { @table_cards = create_cards_list %w(JH 7D AC AS 6H) }
			it { expect(@player.find_highest_combination(@table_cards)[:type]).to eq "Full House" }
		end

		context 'player with Four of a Kind combination' do
			before { @table_cards = create_cards_list %w(JH AD AC AS 6H) }
			it { expect(@player.find_highest_combination(@table_cards)[:type]).to eq "Four of a Kind" }
		end

		context 'player with Straight flush combination' do
			before { @table_cards = create_cards_list %w(KH QH TH AS 6H) }
			it { expect(@player.find_highest_combination(@table_cards)[:type]).to eq "Straight Flush" }
		end

	end

end
