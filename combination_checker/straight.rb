module CombinationChecker
	class Straight < CombinationChecker::Base
		
		TYPE = 'Straight'
		COMBINATION_WEIGHT = 4

		class <<self
		
			def valid?(cards)
				check_for_consistent_faces(cards)
			end

			def calculate_weight(cards)
				faces = cards.map {|c| c.face }
				weight = Card.get_max_face_weight faces
				return (weight == 13 ? 0 : weight)
			end

		end

	end
end
