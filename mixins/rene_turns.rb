module ReneTurns

	def turn_right
		turn_left
		turn_left
		turn_left
	end

	def climb_stair
		turn_left
		move
		turn_right
		move 
	end

	def sweep_stairs
		climb_stair
		pick_beeper
		climb_stair
		pick_beeper
		climb_stair
		pick_beeper
		turn_off
	end

	def back_up
		turn_left
		turn_left
		move
		turn_left
		turn_left
	end

	def turn_around
		turn_left
		turn_left
	end

	def one_block_left
		move
		turn_left
		move
	end

	def one_block_right
		move
		turn_right
		move
	end

	def two_turn_one_block_left
		turn_left
		move
		turn_left
		move
	end

	def two_turn_one_block_right
		turn_right
		move
		turn_right
		move		
	end

	def move_8
		move
		move
		move
		move
		move
		move
		move
		move
	end
end