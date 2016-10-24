require 'spec_helper'
require './card'

describe Card do

	context 'Instance methods' do
		before { @card = Card.new("2", "H") }

		context '#weight' do
			it { expect(@card.weight).to eq 1 }

			it 'should return -1 because invalid face' do
				@card.face = "1"
				expect(@card.weight).to eq -1
			end
		end

		context '#to_s' do
			it { expect(@card.to_s).to eq "2H" }
		end
	end


	context 'Class methods' do
		before { @cards = create_cards_list %w(AH JS 2D QC KD TH) }

		context '#sort' do
			it { expect(Card.sort(@cards).map(&:to_s)).to eq %w(2D TH JS QC KD AH) }
		end

		context '#face_weight' do
			it do 
				expect(Card.face_weight("2")).to eq 1
				expect(Card.face_weight("1")).to eq -1
			end
		end

		context '#faces_weights' do
			it { expect(Card.faces_weights(["2", "3", "T", "A", "1"])).to eq [1, 2, 9, 13, -1] }
		end

		context '#get_max_face_weight' do
			it { expect(Card.get_max_face_weight(["2", "3", "T", "A"])).to eq 13 }
		end

		context '#get_min_face_weight' do
			it { expect(Card.get_min_face_weight(["2", "3", "T", "A"])).to eq 1 }
		end

		context '#names' do
			it { expect(Card.names(@cards)).to eq "AH JS 2D QC KD TH" }
		end
	end

end
