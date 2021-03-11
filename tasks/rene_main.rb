$graphical = true

require_relative "rene_robot"
require_relative "../karel/robota"

def task()
  world = Robota::World
  # world.read_world("../worlds/reorganize.txt")

  karel = ReneRobot.new(1, 1, Robota::NORTH, 1)
  karel2 = ReneRobot.new(6, 1, Robota::EAST, 0)
  karel3 = ReneRobot.new(6, 6, Robota::SOUTH,0)
  karel4 = ReneRobot.new(1, 6, Robota::WEST, 0)


  robots = []
  robots << karel
  robots << karel2
  robots << karel3
  robots << karel4

  karel.put_beeper

  robots.each do |r|
    r.cycle
  end
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