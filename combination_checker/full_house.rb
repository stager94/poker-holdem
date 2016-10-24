module CombinationChecker
	class FullHouse < CombinationChecker::Base
		
		TYPE = 'Full House'
		COMBINATION_WEIGHT = 6

		class <<self

				def valid?(cards)
					groups = cards_faces_groups_count(cards)
					return groups[0][1] == 3 && groups[1][1] == 2
				end

				def calculate_weight(cards)
					groups = cards_faces_groups_count(cards)
					pairs_weights = [Card.face_weight(groups[0][0]), Card.face_weight(groups[1][0])]
					return pairs_weights[0] * 100 + pairs_weights[1] * 1
				end

		end

	end
end
