module CombinationChecker
	class TwoPair < CombinationChecker::Base
		
		TYPE = 'Two Pair'
		COMBINATION_WEIGHT = 2

		class <<self
			
			def valid?(cards)
				groups = cards_faces_groups_count(cards)
				return groups[0][1] == 2 && groups[1][1] == 2
			end

			def calculate_weight(cards)
				groups = cards_faces_groups_count(cards)
				pairs_weights = [Card.face_weight(groups[0][0]), Card.face_weight(groups[1][0])].sort
				additional = Card.face_weight groups[2][0]
				return  additional * 1 + pairs_weights[0] * 100 + pairs_weights[1] * 10000
			end

		end

	end
end
