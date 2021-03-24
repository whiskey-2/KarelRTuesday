$graphical = true

require_relative "../karel/ur_robot"
require_relative "../mixins/sensor_pack"
require_relative "../mixins/rene_turns"
require_relative "../mixins/rene_beepers"

class Neil < UrRobot
  include ReneTurns
  include ReneBeepers
  include SensorPack

  @commandes = %w[move move move move move move move turn_left turn_left turn_left move move move put_beeper]

  def follow
  	@commandes
  end
end

def task()
  world = Robota::World
  world.read_world("../worlds/corridor.txt")

  karel = Neil.new(2, 5, Robota::EAST, 1)
  karel.follow.each do |r|
  	karel.send(r) if karel.respond_to?(r)
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

end

