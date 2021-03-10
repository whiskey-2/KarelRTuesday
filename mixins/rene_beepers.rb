module ReneBeepers

	def turn_left_beeper
		turn_left
		move
		pick_beeper
		turn_left
	end

	def turn_right_beeper
		turn_right
		move
		pick_beeper
		turn_right
	end

	def beeper_every_other
		move
		move
		put_beeper
	end

	def beeper_infront
		move
		put_beeper
	end

	def beeper_for_7
		beeper_infront
		beeper_infront
		beeper_infront
		beeper_infront
		beeper_infront
		beeper_infront
		beeper_infront
	end

	def no_beeper_every_other
		move
		move
		pick_beeper
	end

	def no_beeper_infront
		move
		pick_beeper
	end
end