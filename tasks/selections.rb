$graphical = true

require_relative "../karel/ur_robot"
require_relative "../mixins/sensor_pack"
require_relative "../mixins/rene_turns"
require_relative "../mixins/rene_beepers"

class Actions < UrRobot
  include ReneTurns
  include ReneBeepers
  include SensorPack

  def pattern
    80.times do
      unless front_is_clear?
        if facing_east?
          turn_left
          move
          turn_left
        else
          if facing_west?
            turn_right
            move
            turn_right
          end
        end
      end
      move
      if next_to_a_beeper?
        pick_beeper
      end
    end
  end

  def deposit
    80.times do
      unless front_is_clear?
        if facing_east?
          put_beeper
          put_beeper
          turn_left
          move
          turn_left
        else
          if facing_west?
            put_beeper
            put_beeper
            turn_right
            move
            turn_right
          end
        end
      end
      put_beeper
      put_beeper
      move
      if next_to_a_beeper?
        pick_beeper
      end
    end
  end
end


def task()
  world = Robota::World
  world.read_world("../worlds/aleatoire.kwld")

  karel = Actions.new(2, 2, Robota::EAST, INFINITY)
  karel.deposit
  karel.put_beeper
  karel.put_beeper
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