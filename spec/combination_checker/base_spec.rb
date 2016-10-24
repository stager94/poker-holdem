require 'spec_helper'
require './combination_checker'


describe CombinationChecker::Base do

	subject { CombinationChecker::Base }

	context '#check_for_same_suits' do
		before do 
			@same_suits_cards = create_cards_list %w(AH KH QH JH TH)
			@different_suits_cards = create_cards_list %w(AH KD QS JC TH)
		end
		
		it {
			expect(subject.check_for_same_suits(@same_suits_cards)).to eq true
		}

		it {
			expect(subject.check_for_same_suits(@different_suits_cards)).to eq false
		}
	end

	context '#check_for_consistent_faces' do
		before do
			@consistent_faces_cards = create_cards_list %w(2H 3H 4H 5H 6H)
			@not_consistent_faces_cards = create_cards_list %w(2H 4H 6H KH QH)
		end

		it { expect(subject.check_for_consistent_faces(@consistent_faces_cards)).to eq true }
		it { expect(subject.check_for_consistent_faces(@not_consistent_faces_cards)).to eq false }
	end

	context '#prepare_result' do
		before { @cards = create_cards_list %w(AH KH QH JH TH) }
		it do
			expect(subject.prepare_result('High', @cards, 1, 13)).to eq({ type: 'High', cards: @cards, combination_weight: 1, weight: 13 })
		end
	end

	context 'private methods' do
		before { @cards = create_cards_list %w(AH TC AD 6S JH) }

		context '#cards_sort_by_weight' do
			it do
				expect(subject.send(:cards_sort_by_weight, @cards).map(&:to_s)).to eq %w(5 9 10 13 13)
			end
		end

		context '#cards_suits_array' do
			it { expect(subject.send :cards_suits_array, @cards).to eq ['H','C','D','S','H'] }
		end

		context '#cards_faces_groups_count' do
			it do
				expect(subject.send :cards_faces_groups_count, @cards).to eq([["A",2],["6",1],["T",1],["J",1]])
			end
		end
	end

end

shared_examples 'combination_checkable' do

	context '#valid?' do
		it do
			expect(described_class.valid?(@cards[0])).to eq true
			expect(described_class.valid?(@cards[1])).to eq true
			expect(described_class.valid?(@cards[2])).to eq false if @cards[2]
		end
	end

	context '#check' do
		it do
			@cards.each_with_index do |cards, index|
				expect(described_class.check(cards)).to eq(@results[index])
			end
		end
	end

	context '#check' do
		it do
			@cards[0..1].each_with_index do |cards, index|
				expect(described_class.send(:calculate_weight, cards)).to eq(@results[index][:weight])
			end
		end
	end

end
