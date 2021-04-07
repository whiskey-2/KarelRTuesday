$graphical = true

require_relative "../mixins/rene_beepers"
require_relative "../mixins/rene_turns"
require_relative "../mixins/sensor_pack"
require_relative "../karel/ur_robot"

class Macon < UrRobot
	include ReneTurns
  	include ReneBeepers
  	include SensorPack

  	def complete(x,y,number)
  		# x repr/sente la longuer a voyager sur x
  		# y represente la longuer a voygaer sur y
  		# number represente le nombre de beepers qui constitue chaque bloque du mur
  		2.times do
  			x.times do
  				while next_to_a_beeper?
  					pick_beeper
  				end
  				move
  			end
  			turn_left
  			y.times do
  				while next_to_a_beeper?
  					pick_beeper
  				end
  				move
  			end
  			turn_left
  		end
  		2.times do
  			x.times do
  				number.times do
  					put_beeper
  				end
  				move
  			end
  			turn_left
  			y.times do
  				number.times do
  					put_beeper
  				end
  				move
  			end
  			turn_left
  		end
  	end
end


def task()
  world = Robota::World
  world.read_world("../worlds/mur.kwld")

  karel = Macon.new(2, 3, Robota::EAST, INFINITY)
  karel.complete(6, 8, 5)
end


if __FILE__ == $0
  if $graphical
     screen = window(12, 200) # (size, speed)
     screen.run do
       task
     end
   else
     task
   end
end