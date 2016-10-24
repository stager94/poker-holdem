module CombinationChecker
	class High < CombinationChecker::Base
	
		TYPE = 'High'
		COMBINATION_WEIGHT = 0

		class <<self
				
			def calculate_weight(cards)
				faces = cards.map &:face
				return Card.get_max_face_weight faces
			end
			
		end

	end
end
