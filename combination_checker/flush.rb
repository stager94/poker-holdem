module CombinationChecker
	class Flush < CombinationChecker::Base

		TYPE = 'Flush'
		COMBINATION_WEIGHT = 6

		class <<self

			def valid?(cards)
				check_for_same_suits(cards)
			end

			def calculate_weight(cards)
				faces = cards.map {|c| c.face }
				weights = faces.map {|f| Card.face_weight(f) }.sort
				return weights.each.with_index.inject(0) {|s,(e,i)| s += e * 100**i }
			end

		end
		
	end
end
