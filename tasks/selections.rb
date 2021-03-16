$graphical = true

require_relative "../karel/ur_robot"
require_relative "../mixins/sensor_pack"
require_relative "../mixins/rene_turns"
require_relative "../mixins/rene_beepers"

class Actions < UrRobot
  include ReneTurns
  include ReneBeepers
  include SensorPack

  def Pattern
    10000.times do
      unless next_to_a_beeper?
        move
        if front_is_clear?
          move
        else
          turn_right
        end
      else
        pick_beeper      
      end
    end
  end
end


def task()
  world = Robota::World
  world.read_world("../worlds/aleatoire.kwld")

  karel = Actions.new(2, 2, Robota::NORTH, 0)
  karel.Pattern
end


if __FILE__ == $0
  if $graphical
     screen = window(12, 80) # (size, speed)
     screen.run do
       task
     end
   else
     task
   end
end