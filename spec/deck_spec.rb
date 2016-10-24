require 'spec_helper'
require './deck'

describe Deck do

	before do
		@deck = Deck.new
	end

	context '#initialize' do
		it { expect(@deck.cards.length).to eq 52 }
	end

	context '#initialize_cards' do
		before { @deck.cards = [] }
		it { expect { @deck.send(:initialize_cards) }.to change { @deck.cards.length }.from(0).to(52) }
	end

	context '#card_variants' do
		it { expect(@deck.send(:card_variants)).to match_array(card_names_list) }
	end

	context '#get_random_cards' do
		it do
			expect(@deck.get_random_cards.length).to eq 1
			expect(@deck.get_random_cards(3).length).to eq 3
		end
	end

	context '#get_cards' do
		it 'should take cards from deck and return array with that cards' do
			expect(@deck.cards.length).to eq 52
			cards = @deck.get_cards 2
			expect(@deck.cards.length).to eq 50
			cards.each {|card| expect(@deck.cards.find {|c| c.face == card.face && c.suit == card.suit }).to eq nil }
		end
	end

	context '#get_card' do
		before { @card = Card.new 'A', 'H' }

		it 'should take cards from deck and return array with that cards' do
			expect { @deck.get_card(@card) }.to change { @deck.cards.length }.from(52).to(51)
			expect(@deck.cards.find {|c| c.face == 'A' && c.suit == 'H' }).to eq nil
		end
	end

end
