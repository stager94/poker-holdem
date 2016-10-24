module CombinationChecker
	class StraightFlush < CombinationChecker::Base

		TYPE = 'Straight Flush'
		COMBINATION_WEIGHT = 8

		class <<self

			def valid?(cards)
				check_for_consistent_faces(cards) && check_for_same_suits(cards)
			end

			def calculate_weight(cards)
				faces = cards.map &:face
				weight = Card.get_max_face_weight faces
				return (weight == 13 ? 0 : weight)
			end

		end

	end
end
