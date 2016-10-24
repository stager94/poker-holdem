module CombinationChecker
	class OnePair < CombinationChecker::Base

		TYPE = 'Pair'
		COMBINATION_WEIGHT = 1
		
		class <<self

			def calculate_weight(cards)
				groups = cards_faces_groups_count(cards)
				faces = groups[1..-1].map {|k,v| k }
				base = Card.face_weight groups.first[0]
				weights = Card.faces_weights(faces).sort
				return weights[0] * 1 + weights[1] * 100 + weights[2] * 10000 + base * 1000000
			end

			def valid?(cards)
				groups = cards_faces_groups_count(cards)
				return groups.first[1] == 2
			end

		end

	end
end


