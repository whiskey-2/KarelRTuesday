$graphical = true

require_relative "../karel/ur_robot"
require_relative "../mixins/sensor_pack"
require_relative "../mixins/rene_turns"
require_relative "../mixins/rene_beepers"

class Recursion < UrRobot
  include ReneTurns
  include ReneBeepers
  include SensorPack

  def move_until(robot)
  	robot.move
  	robot.puts(robot-1)
  end

  def spiral (number) #this is some bs
  	unless (number == 0)
  		number.times do
  			number-1
  			number.times do
  				move
  				put_beeper
  			end
  			turn_right
  		end
  	else
  		turn_off
  	end
  end
end




def task()
  world = Robota::World
  # world.read_world("../worlds/corridor.txt")

  karel = Recursion.new(19, 1, Robota::EAST, INFINITY)
  karel.spiral(18)
end


if __FILE__ == $0
  if $graphical
     screen = window(20, 200) # (size, speed)
     screen.run do
       task
     end
   else
     task
   end
end