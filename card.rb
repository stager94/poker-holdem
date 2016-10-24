class Card

	POSSIBLE_FACES = %w(2 3 4 5 6 7 8 9 T J Q K A)
	POSSIBLE_SUITS = %w(H S C D)

	attr_accessor :face, :suit

	def initialize(face, suit)
		@face = face
		@suit = suit
	end

	def weight
		Card.face_weight face
	end

	def to_s
		[face, suit].join
	end


	class <<self

		def sort(cards)
			cards.sort_by {|c| c.weight }
		end

		def face_weight(face)
			POSSIBLE_FACES.index(face) + 1 rescue -1
		end

		def faces_weights(faces)
			faces.map {|f| Card.face_weight f }
		end

		def get_max_face_weight(faces)
			faces_weights(faces).max
		end

		def get_min_face_weight(faces)
			faces_weights(faces).min
		end

		def names(cards)
			cards.map {|c| c.to_s }.join " "
		end

	end

end
