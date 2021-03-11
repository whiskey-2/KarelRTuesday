require_relative "../karel/ur_robot"
require_relative "../mixins/rene_turns"
require_relative "../mixins/rene_beepers"
#taking relatives, more may be added


class ReneRobot < UrRobot  #inherting from ur_robot
	include ReneBeepers
	include ReneTurns

	def sweep_row
		move
		pick_beeper
		move
		pick_beeper
		move
		pick_beeper
		move
		pick_beeper
	end

	def sweep_block
		move
		pick_beeper
		sweep_row
		turn_left_beeper
		sweep_row
		turn_right_beeper
		sweep_row
		turn_left_beeper
		sweep_row
		turn_right_beeper
		sweep_row
		turn_left_beeper
		sweep_row
		turn_off
	end

	def bowling
		move
		put_beeper
		beeper_every_other
		one_block_left
		put_beeper
		beeper_every_other
		two_turn_one_block_left
		put_beeper
		turn_right
		one_block_left
		put_beeper
		beeper_every_other
		one_block_left
		put_beeper
		turn_right
		one_block_left
		put_beeper
		turn_left
		beeper_every_other
		one_block_right
	end

	def diamond_field
		no_beeper_infront
		no_beeper_every_other
		no_beeper_every_other
		no_beeper_every_other
		two_turn_one_block_left
		pick_beeper
		turn_right
		one_block_left
		pick_beeper
		turn_right
		one_block_left
		pick_beeper
		one_block_left
		pick_beeper
		one_block_right
		pick_beeper
		turn_around
		no_beeper_every_other
		move
		move
		turn_right
		no_beeper_every_other
		one_block_right
		pick_beeper
		turn_left
		one_block_right
		pick_beeper
		turn_right
		no_beeper_every_other
		turn_left
		no_beeper_every_other
		turn_left
		one_block_left
		pick_beeper
	end

	def construction
		put_beeper
		beeper_for_7
		turn_left
		beeper_for_7
		turn_left
		beeper_for_7
		turn_left
		beeper_for_7
	end

	def clock
		turn_around
		move
		move
		one_block_right
		put_beeper
		one_block_right
		put_beeper
		turn_left
		one_block_right
		put_beeper
		one_block_left
		turn_left
		beeper_infront
		one_block_right
		put_beeper
		turn_left
		one_block_right
		put_beeper
		one_block_left
		turn_left
		beeper_infront
		one_block_right
		put_beeper
		one_block_left
		put_beeper
		turn_right
		one_block_left
		turn_left
		beeper_infront
		one_block_right
		put_beeper
		one_block_left
		put_beeper
	end

	def reorganize
		no_beeper_every_other
		turn_left
		no_beeper_infront
		no_beeper_infront
		turn_around
		move
		no_beeper_every_other
		no_beeper_infront
		turn_around
		move
		move
		put_beeper
		turn_right
		beeper_infront
		beeper_infront
		turn_around
		move
		move
		beeper_infront
		beeper_infront
	end

	def cycle
		pick_beeper
		move
		move
		move
		move
		move
		put_beeper
		turn_right
	end

	def corridor
		turn_around
		move
		move
		move
		turn_right
		move
		move
		move
		move
		move
		pick_10
		move
		pick_10
		turn_right
		move
		pick_10
		turn_around
		move
		turn_left
		move
		move
		move
		move
		move
		move
		turn_left
		move
		move
		move
		move
		turn_left
		move
		move
		turn_left
		move
		move
		move
		turn_left
		move
		pick_10
		turn_around
		move
		move
		move
		move
		turn_right
		move
		move
		move
		move
		move
		move
		turn_left
		move
		move
		move
		move
		turn_right
		move
		turn_right
		move
		turn_around
		40.times do 
			put_beeper
		turn_off
		end
	end
end