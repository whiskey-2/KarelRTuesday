$graphical = true

require_relative "rene_robot"
require_relative "../karel/ur_robot"
require_relative "../karel/robota"
require_relative "../mixins/rene_beepers"
require_relative "../mixins/rene_turns"

class PlacerBot < UrRobot
  @placer_method = nil

  def set_strategy(strategy)
    @placer_method = strategy
  end

  def place_beepers
    @placer_method.place_beepers(self)
  end

end

class Method
  include ReneBeepers
  include ReneTurns

  def place_beepers(robot)
    raise NotImplementedError.new("Strategy is not defined")
  end
end

class SingleMethod < Method
  def place_beepers(robot)
    robot.put_beeper
    8.times do
      robot.beeper_infront
    end
  end
end

class DoubleMethod < Method
  def place_beepers(robot)
    robot.put_beeper
    robot.put_beeper
    8.times do
      robot.beeper_infront
      robot.put_beeper
    end
  end
end

class TripleMethod < Method
  def place_beepers(robot)
    8.times do
      robot.place_3_beepers_and_move
    end
  end
end

class Gerant
  def start
    karel1 = PlacerBot.new(2, 1, Robota::EAST, INFINITY)
    karel2 = PlacerBot.new(3, 1, Robota::EAST, INFINITY)
    karel3 = PlacerBot.new(4, 1, Robota::EAST, INFINITY)

    karel1.placer_method(SingleMethod.new)
    karel2.placer_method(DoubleMethod.new)
    karel3.placer_method(TripleMethod.new)

    karel1.place_beepers
    karel2.place_beepers
    karel3.place_beepers
  end
end



def task()
  world = Robota::World
  # world.read_world("../worlds/corridor.txt")

  gerant = Gerant.new
  gerant.start
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