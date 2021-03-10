$graphical = true

require_relative "rene_robot"
require_relative "../karel/robota"

def task()
  world = Robota::World
  world.read_world("../worlds/analog_clock.txt")

  karel = ReneRobot.new(2, 2, Robota::SOUTH, INFINITY)
  karel.clock
end


if __FILE__ == $0
  if $graphical
     screen = window(10, 80) # (size, speed)
     screen.run do
       task
     end
   else
     task
   end
end