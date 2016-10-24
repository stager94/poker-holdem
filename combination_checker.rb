module CombinationChecker
	
	POSSIBLE_COMBINATIONS = %w(straight_flush four_of_kind full_house flush straight three_of_kind two_pair one_pair high)

	require './combination_checker/base'
	require './combination_checker/straight_flush'
	require './combination_checker/four_of_kind'
	require './combination_checker/full_house'
	require './combination_checker/flush'
	require './combination_checker/straight'
	require './combination_checker/three_of_kind'
	require './combination_checker/two_pair'
	require './combination_checker/one_pair'
	require './combination_checker/high'

end
