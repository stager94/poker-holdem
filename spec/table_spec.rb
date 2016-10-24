require 'spec_helper'
require './table'

describe Table do

	before { @table = Table.new }

	context '#put_card' do
		before { @card = Card.new 'A', 'H' }
		it do
			expect { @table.put_card(@card) }.to change { @table.cards }.from([]).to [@card]
		end
	end

	context '#put_cards' do
		before do 
			@cards1 = create_cards_list %w(AH JD)
			@cards2 = create_cards_list %w(TS)
		end
		it do
			expect { @table.put_cards(@cards1) }.to change { @table.cards }.from([]).to @cards1
			expect { @table.put_cards(@cards2) }.to change { @table.cards }.from(@cards1).to @cards1+@cards2
		end
	end

	context '#card_names' do
		before { @table.put_cards create_cards_list(%w(AH JD TS)) }
		it { expect(@table.card_names).to eq "AH JD TS" }
	end

end
