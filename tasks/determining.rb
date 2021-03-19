$graphical = true

require_relative "../karel/ur_robot"
require_relative "../mixins/sensor_pack"
require_relative "../mixins/rene_turns"
require_relative "../mixins/rene_beepers"

class Spawner < UrRobot
  include ReneTurns
  include ReneBeepers
  include SensorPack

  attr_accessor :street, :avenue

  def initialize (street, avenue, direction, beepers)
    super(street, avenue, direction, beepers)
    @counter = 0
  end


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
        karel2 = UrRobot.new(self.street, self.avenue, Robota::NORTH, 0)
      end
    end
  end

  def addition
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
        @counter = @counter + 1
      end
    end
    puts @counter
  end
end



def task()
  world = Robota::World
  world.read_world("../worlds/aleatoire.kwld")

  karel = Spawner.new(2, 2, Robota::EAST, 1)
  karel.addition

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