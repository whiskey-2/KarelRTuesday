$graphical = true

require_relative "rene_robot"
require_relative "../karel/robota"

def task()
  world = Robota::World
  world.read_world("../worlds/corridor.txt")

  karel = ReneRobot.new(2, 5, Robota::EAST, 1)
  karel.corridor
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