module CombinationChecker
	class ThreeOfKind < CombinationChecker::Base

		TYPE = 'Three of a Kind'
		COMBINATION_WEIGHT = 3
		
		class <<self

			def valid?(cards)
				groups = cards_faces_groups_count(cards)
				return groups[0][1] == 3 && groups[1][1] == 1
			end

			def calculate_weight(cards)
				groups = cards_faces_groups_count(cards)
				faces = groups[1..-1].map {|k,v| k }
				base = Card.face_weight groups.first[0]
				weights = Card.faces_weights(faces).sort
				return weights[0] * 1 + weights[1] * 100 + base * 10000
			end

		end

	end
end
