module CombinationChecker
	class Base

		class <<self

			def check_for_same_suits(cards)
				cards_suits_array(cards).uniq.count == 1
			end

			def check_for_consistent_faces(cards)
				consistent = true
				weights = cards_sort_by_weight(cards)
				
				return true if weights == [1,2,3,4,13]

	 			weights.reduce {|l, r| break unless consistent &= (r-l == 1); r}
				consistent
			end

			def prepare_result(type, cards, combination_weight, weight)
				{
					type: type,
					cards: cards,
					combination_weight: combination_weight,
					weight: weight
				}
			end

			def check(cards)
				if valid?(cards)
					prepare_result self::TYPE, cards, self::COMBINATION_WEIGHT, calculate_weight(cards)
				else
					false
				end
			end

			def valid?(cards = [])
				true
			end

		private

			def cards_sort_by_weight(cards)
				cards.map(&:weight).sort
			end

			def cards_suits_array(cards)
				cards.map(&:suit)
			end

			def cards_faces_groups_count(cards)
				cards.inject(Hash.new(0)) {|h, c| h[c.face] += 1; h }.sort_by {|k,v| -v }
			end

		end

	end
end
