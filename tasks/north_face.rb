require_relative "../karel/ur_robot"
require_relative "../mixins/rene_turns"
require_relative "../mixins/rene_beepers"
#taking relatives, more may be added


class NorthFace < UrRobot  #inherting from ur_robot
	include ReneBeepers
	include ReneTurns

	def initialize (street, avenue, direction, beepers)
    	super(street, avenue, NORTH, beepers)
  	end
end